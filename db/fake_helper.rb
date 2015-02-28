Faker::Config.locale = 'en-US'

# Fake User Properties
def fake_billing_address(user_id: user_id)
  {
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postal_code: Faker::Address.zip_code,
    user_id: user_id
  }
end

def fake_shipping_adddress(user_id: user_id)
  {
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postal_code: Faker::Address.zip_code,
    user_id: user_id
  }
end

def fake_credit_card(user_id: user_id, billing_address_id: billing_address_id)
  {
    billing_address_id: billing_address_id,
    user_id: user_id,
    expiry_date: Faker::Date.between(Date.today, 1.years.from_now),
    holder_first_name: Faker::Name.first_name,
    holder_last_name: Faker::Name.last_name,
    card_number: Faker::Business.credit_card_number,
    security_code: Faker::Number.number(3)
  }
end

def fake_phone_number(user_id: user_id)
  {
    phone_type: fake_phone_type,
    number: Faker::PhoneNumber.phone_number,
    user_id: user_id
  }
end

# Fake Products
def fake_category
  {
    title: Faker::Commerce.department,
    description: Faker::Lorem.pararaph
  }
end

def fake_product
  {
    name: Faker::Commerce.product_name,
    sku: fake_sku,
    description: Faker::Lorem.paragraph,
    price: Faker::Comerce.price,
  }
end

# Fake Orders and Shopping Carts

def fake_order(times)

  {

  }
end



# def fake_shopping_cart_product(user_id: user_id)
#   {
#     user_id: user_id,
#     total_cost: 
#   }
# end

def fake_shopping_cart(qty)
  qty.times do
    user = User.all.sample
    order_created_at = Faker::Time.between(user.created_at,Time.now)
    ShoppingCart.create(
      { customer_profile_id: user.id,
        shipping_address_id: user.default_shipping_address_id,
        billing_address_id: user.default_billing_address_id,
        payment_method_id: user.default_payment_method_id,
        shopping_cart: false,
        created_at: order_created_at,
        updated_at: order_created_at })
    add_random_products_to_order(order_id: ShoppingCart.last.id)
  end
end

def add_random_products_to_order(order_id: order_id)
  3.times do
    ShoppingCartProduct.create(
    { order_id: order_id,
      product_id: Product.all.sample.id,
      product_qty: (rand(4)+1)
      })
  end
end

def fake_user_profile
  {
    default_shipping_id:
    default_billing_id:
    default_credit_card:
  }
end

def fake_user(joined: joined)
  {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    user_profile_id: UserProfile.all.sample,
    created_at: joined,
    updated_at: joined
  }
end

# Generators

def generate_product_category(number_of_times)
  number_of_times.times do
    ProductCategory.create generate_product_category
end

def generate_users(qty)
  fifth = qty/5
  ramp_up_users(qty: fifth,
                start_date: 1.year.ago,
                end_date: 6.months.ago )
  ramp_up_users(qty: fifth,
                start_date: 6.months.ago,
                end_date: 3.months.ago)
  ramp_up_users(qty: fifth,
                start_date: 3.months.ago,
                end_date: 1.month.ago)
  ramp_up_users(qty: fifth,
                start_date: 1.month.ago,
                end_date: 1.week.ago)
  ramp_up_users(qty: fifth,
                start_date: 1.week.ago,
                end_date: Time.now)
end

def ramp_up_users(qty: qty,
                  start_date: start_date,
                  end_date: end_date)
  qty.times do
    joined = Faker::Time.between(start_date,end_date)
    User.create fake_user(joined: joined)
  end
end

def generate_user_profile
  User.all.sample.each do |user|
    generate_single_customer_profile(user: user)
    user.update(user_profile_id: CustomerProfile.last.id)
end

def generate_billing_addresses(qty)
  qty.times do
    cp = User.all.sample
    BillingAddress.create fake_billing_address(user_id: cp.id)
  end
end

def generate_shipping_addresses(qty)
  qty.times do
    cp = User.all.sample
    ShippingAddress.create fake_shipping_address(user_id: cp.id)
  end
end

def generate_products(qty)
  qty.tiemes do
    Product.create fake_product
  end
end

# Helper Methods

def fake_sku
  rand(36**8).to_s(36)
end


def fake_phone_type
  ["work", "mobile", "home"].sample
end

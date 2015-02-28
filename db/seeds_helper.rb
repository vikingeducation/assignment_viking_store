Faker::Config.locale = 'en-US'

# fake_object

def fake_product_category
  { name: Faker::Commerce.department,
    description: Faker::Lorem.paragraph }
end

def fake_product
  { sku: random_fake_sku,
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    product_category_id: ProductCategory.all.sample.id }
end

def random_fake_sku
  sku = ("A".."Z").to_a.sample(3)
  sku << ("0".."9").to_a.sample(4)
  sku.join
end

def fake_user(joined: joined)
  { name: Faker::Name.name,
    email: Faker::Internet.email,
    created_at: joined,
    updated_at: joined }
end

def fake_address(customer_profile_id: customer_profile_id)
  { customer_profile_id: customer_profile_id,
    street_1: Faker::Address.street_address,
    street_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code }
end

def fake_payment_method(customer_profile_id: customer_profile_id, name: name)
  { customer_profile_id: customer_profile_id,
    name_on_card: name,
    card_number: Faker::Business.credit_card_number,
    exp_date: Faker::Date.between(Date.today, 3.years.from_now),
    security_code: Faker::Number.number(3) }
end

def generate_single_customer_profile(user: user)
  cp = CustomerProfile.create

  cp.update(phone_number: Faker::PhoneNumber.phone_number)

  address = Address.create fake_address(customer_profile_id: cp.id)
  cp.update(default_shipping_address_id: address.id)
  cp.update(default_billing_address_id: address.id)

  pmt_method = PaymentMethod.create fake_payment_method(customer_profile_id: cp.id, name: user.name)
  cp.update(default_payment_method_id: pmt_method.id)

  creation_date = Faker::Time.between(user.created_at,Time.now)
  cp.update(created_at: creation_date)
  cp.update(updated_at: creation_date)

  shopping_cart = Order.create({
    customer_profile_id: cp.id,
    shopping_cart: true,
    created_at: creation_date,
    updated_at: creation_date
    })
  cp.update(shopping_cart_id: shopping_cart.id)
end

# generate_fake_objects

def generate_product_categories(qty)
  qty.times do
    ProductCategory.create fake_product_category
  end
end

def generate_products(qty)
  qty.times do
    Product.create fake_product
  end
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

def generate_customer_profiles(qty)
  User.all.sample(qty).each do |user|
    generate_single_customer_profile(user: user)
    user.update(customer_profile_id: CustomerProfile.last.id)
  end
end

def generate_extra_addresses(qty)
  qty.times do
    cp = CustomerProfile.all.sample
    Address.create fake_address(customer_profile_id: cp.id)
  end
end

def generate_historical_orders(qty)
  qty.times do
    cp = CustomerProfile.all.sample
    order_created_at = Faker::Time.between(cp.created_at,Time.now)
    Order.create(
      { customer_profile_id: cp.id,
        shipping_address_id: cp.default_shipping_address_id,
        billing_address_id: cp.default_billing_address_id,
        payment_method_id: cp.default_payment_method_id,
        shopping_cart: false,
        created_at: order_created_at,
        updated_at: order_created_at })
    add_random_products_to_order(order_id: Order.last.id)
  end
end

def add_random_products_to_order(order_id: order_id)
  3.times do
    OrderProduct.create(
    { order_id: order_id,
      product_id: Product.all.sample.id,
      product_qty: (rand(4)+1)
      })
  end
end

def fill_shopping_carts(qty)
  qty.times do
    cp = CustomerProfile.all.sample
    shopping_cart_id = cp.shopping_cart_id
    add_random_products_to_order(order_id: shopping_cart_id)
  end
end
Faker::Config.locale = 'en-US'

# fake_object

def fake_product_category
  { name: Faker::Commerce.department,
    description: Faker::Lorem.paragraph }
end

def fake_product
  { name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    product_category_id: (rand(5) + 1) }
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

def fake_order
end

def fake_shopping_cart
end

def fake_payment_method(customer_profile_id: customer_profile_id, name: name)
  { customer_profile_id: customer_profile_id,
    name_on_card: name,
    card_number: Faker::Business.credit_card_number,
    exp_date: Faker::Date.between(Date.today, 3.years.from_now),
    security_code: Faker::Number.number(3) }
end

def fake_customer_profile(name: name)
  id = next_customer_id
  phone_num = Faker::PhoneNumber.phone_number
  address = Address.create fake_address(customer_profile_id: id)
  pmt_method = PaymentMethod.create fake_payment_method(customer_profile_id: id, name: name)
  shopping_cart = nil
  return {  phone_number: phone_num,
            default_shipping_address_id: address.id,
            default_billing_address_id: address.id,
            default_payment_method_id: pmt_method.id,
            shopping_cart_id: nil }
end

def next_customer_id
  if CustomerProfile.last.nil?
    1
  else
    CustomerProfile.last.id + 1
  end
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
    cp = CustomerProfile.create fake_customer_profile(name: user.name)
    user.update(customer_profile_id: cp.id)
  end
end


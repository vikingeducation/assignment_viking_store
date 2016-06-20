puts "Deleting existing data..."

Address.delete_all
Billing.delete_all
Cart.delete_all
Category.delete_all
City.delete_all
Order.delete_all
Payment.delete_all
Product.delete_all
State.delete_all
User.delete_all

puts "Data has been deleted."

puts "Generating random new data."

def create_user(start_time, end_time)
  User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    created_at: Faker::Time.between(start_time, end_time)
  )
end

def create_address(user)
  Address.create(
    user_id: user.id,
    street_address: Faker::Address.street_address,
    city_id: rand(1..100),
    state_id: rand(1..20),
    zip_code: Faker::Address.zip_code
  )
end

def create_payment(user)
  Payment.create(
    user_id: user.id,
    card_number: Faker::Business.credit_card_number,
    card_type: Faker::Business.credit_card_type,
    expiration: Faker::Business.credit_card_expiry_date,
    security_code: rand(101..999)
  )
end

def create_product
  Product.create(
    category_id: rand(1..10),
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price,
    sku: rand(1000000..9999999)
  )
end

def create_order(user)
  Order.create(
    user_id: user.id,
    checkout: Faker::Date.between(1.year.ago, Date.today)
  )
end

def create_cart(order)
  Cart.create(
    order_id: order.id,
    product_id: rand(1..50),
    quantity: rand(1..20),
    created_at: Faker::Date.between(1.year.ago, Date.today)
  )
end

def create_billing(user, order)
  Billing.create(
    user_id: user.id,
    address_id: Address.where("user_id = #{user.id}"),
    payment_id: Payment.where("user_id = #{user.id}"),
    created_at: order.checkout
  )
end

puts "Create cities"

100.times do
  City.create(name: Faker::Address.city)
end

puts "Create states"

20.times do
  State.create(name: Faker::Address.state)
end

puts "Create categories"

10.times do
  Category.create(title: Faker::Commerce.department)
end

puts "Create users"

100.times do
  create_user(Time.now, 12.months.ago)
  create_user(8.months.ago, 12.months.ago)
  create_user(4.months.ago, 8.months.ago)
end

puts "Create products"

40.times do
  create_product
end

puts "create orders and shopping carts"

50.times do |num|
  user = User.all.sample
  order = create_order(user)
  create_cart(order)

  if rand(0..1) == 0
    order.update(checkout: Faker::Date.between(4.months.ago, Time.now))
    rand(1..5).times do
      create_address(user)
    end
    billing = create_billing(user, order)
    order.update(billing_id: billing.id)
  end
end

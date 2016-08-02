# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |n|
  u = User.new
  u.email = Faker::Internet.email
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.phone = Faker::PhoneNumber.phone_number
  u.save
end

users = User.all
users.each do |user|
  add = Address.new
  add.city = Faker::Address.city
  add.state = Faker::Address.state
  add.zip = Faker::Address.zip
  add.user_id = user.id
  add.address_line_1 = Faker::Address.street_address
  add.save

  to_update = { :default_billing_id => add.id,
                :default_shipping_id => add.id }
  user.update(to_update)

  card = Card.new
  card.number = Faker::Business.credit_card_number
  card.company = Faker::Business.credit_card_type
  card.exp_date = Faker::Business.credit_card_expiry_date
  card.security_code = Faker::Number.number(3)
  card.user_id = user.id
  card.save
end

10.times do |n|
  c = Category.new
  c.name = Faker::Music.instrument
  c.description = Faker::Lorem.sentence
  c.save
end

50.times do |n|
    p = Product.new
    p.title =  Faker::Beer.name
    p.description =  Faker::Hipster.sentence
    p.price = Faker::Commerce.price
    p.sku  = Faker::Number.number(10)
    p.category_id = Category.all.sample.id
    p.save
end

20.times do |n|
  ord = Order.new
  ord.processed_date = Faker::Date.backward(n)
  ord.shipping_address = Faker::Address.street_address
  ord.billing_address = Faker::Address.street_address
  ord.user_id = User.all.sample.id
end

orders = Order.all
orders.each do |order|
  op = OrderProduct
  op.quantity = Faker.Number(1)
  op.product_id = Product.all.sample.id
  op.order_id = order.id
end

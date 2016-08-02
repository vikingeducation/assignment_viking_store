# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do |i|
  c = Category.new
  c.name = Faker::Pokemon.name
  c.description = Faker::Pokemon.location
  c.save
end

50.times do |i|
  product = Product.new
  product.title = Faker::Commerce.product_name
  product.description = Faker::ChuckNorris.fact
  product.price = Faker::Commerce.price * 100
  product.category_id = Category.all.sample.id
  product.sku = product.id
  product.save
end

5.times do |i|
  u = User.new
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = Faker::Internet.email
  u.save
end

user_for_order = User.all.sample
o = Order.new
o.user_id = user_for_order.id
o.save

l = Location.new
l.state = Faker::Address.state_abbr
l.street = Faker::Address.street_address
l.city = Faker::Address.city
l.zip = Faker::Address.zip
l.user_id = user_for_order.id
l.save

user_for_order.default_shipping = l.id
user_for_order.default_billing = l.id

kart_item = Item.new
kart_item.order_id = o.id
kart_item.product_id = Product.all.sample.id
kart_item.quantity = rand(4) + 1
kart_item.unit_price = Product.find(kart_item.product_id).price

payment = Payment.new
payment.user_id = user_for_order.id
payment.name = user_for_order.first_name
payment.cc_number = Faker::Business.credit_card_number
payment.experation = Faker::Business.credit_card_expiry_date

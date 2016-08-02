# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def destroy_all
  City.destroy_all
  State.destroy_all
  Address.destroy_all
  Card.destroy_all
  User.destroy_all
  Product.destroy_all
  Category.destroy_all
  Order.destroy_all
  OrderProduct.destroy_all
end


def numbers
  result = []
  (1..100).to_a.each do |n|
    (100-n).times do |m|
      result << n
    end
  end
  result
end

destroy_all
seed_multiplier = 1

(100*seed_multiplier).times do |n|
  u = User.new
  u.email = Faker::Internet.email
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.phone = Faker::PhoneNumber.phone_number
  u.created_at = numbers.sample.days.ago
  u.save
end

(8*seed_multiplier).times do |n|
  s = State.new
  s.name = Faker::Address.state
  s.save
end

(100*seed_multiplier).times do |n|
  c = City.new
  c.name = Faker::Address.city
  c.state_id = State.all.sample.id
  c.save
end

cities = City.all.limit(30*seed_multiplier)
users = User.all
users.each do |user|
  (0..5).to_a.sample.times do |n|
    add = Address.new
    add.city_id = cities.sample.id
    add.zip = Faker::Address.zip
    add.user_id = user.id
    add.address_line_1 = Faker::Address.street_address
    add.save
  end
  default = Address.where(user_id: user.id)
  to_update = { :default_billing_id => default,
                :default_shipping_id => default }
  user.update(to_update) if default

  card = Card.new
  card.number = Faker::Business.credit_card_number
  card.company = Faker::Business.credit_card_type
  card.exp_date = Faker::Business.credit_card_expiry_date
  card.security_code = Faker::Number.number(3)
  card.user_id = user.id
  card.save
end

(6*seed_multiplier).times do |n|
  c = Category.new
  c.name = Faker::Music.instrument
  c.description = Faker::Lorem.sentence
  c.save
end

(15*seed_multiplier).times do |n|
  p = Product.new
  p.title =  Faker::Beer.name
  p.description =  Faker::Hipster.sentence
  p.price = Faker::Commerce.price
  p.sku  = Faker::Number.number(10)
  p.category_id = Category.all.sample.id
  p.save
end

(100*seed_multiplier).times do |n|
  ord = Order.new
  ord.processed_date = Faker::Date.backward(numbers.sample)
  ord.user_id = User.all.sample.id
  ord.shipping_address = Address.where(user_id: ord.user_id).sample.address_line_1
  ord.billing_address = Address.where(user_id: ord.user_id).sample.address_line_1
  ord.save
end

(25*seed_multiplier).times do |n|
  ord = Order.new
  ord.user_id = User.all.sample.id
  ord.save
end


orders = Order.all
orders.each do |order|
  op = OrderProduct
  op.quantity = Faker.Number(1)
  op.product_id = Product.all.sample.id
  op.order_id = order.id
  op.save
end

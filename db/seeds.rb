# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
scale = 100

# warehouse = Location.new
# warehouse.state = Faker::Address.state_abbr
# warehouse.street = Faker::Address.street_address
# warehouse.city_id = Faker::Address.city
# warehouse.zip = Faker::Address.zip
# warehouse.save

states = Array.new
10.times { states << Faker::Address.state_abbr }
states.uniq.each { |state| State.create(abbr: state)}

scale.times do
  city = City.new
  city.name = Faker::Address.city
  city.state_id = State.all.sample.id
  city.save
end

scale.times do |count|
  if count.even?
    create_city
  else
    create_city(10)
  end
end

def create_city(limit = scale)
  l = Location.new

  l.street = Faker::Address.street_address
  l.city_id = City.all.limit(scale).sample.id
  l.zip = Faker::Address.zip
  l.user_id = user_for_order.id
  l.save
end

6.times do |i|
  c = Category.new
  c.name = Faker::Pokemon.name
  c.description = Faker::Pokemon.location
  c.save
end

(rand(20) + 10).times do |i|
  product = Product.new
  product.title = Faker::Commerce.product_name
  product.description = Faker::ChuckNorris.fact
  product.price = Faker::Commerce.price * 100
  product.category_id = Category.all.sample.id
  product.sku = rand(897) + 1
  product.save
end

scale.times do |i|
  user_for_order = User.new
  user_for_order.first_name = Faker::Name.first_name
  user_for_order.last_name = Faker::Name.last_name
  user_for_order.phone = Faker::PhoneNumber.phone_number
  user_for_order.email = Faker::Internet.email
  time_for_save = Faker::Time.backward(365, :all)
  user_for_order.created_at = time_for_save
  user_for_order.save
end

User.all.each do |user_for_order|
  rand(5).times do
    l = Location.new
    l.street = Faker::Address.street_address
    l.city_id = City.all.sample.id
    l.zip = Faker::Address.zip
    l.user_id = user_for_order.id
    l.save
  end

  if default = Location.find_by(user_id: user_for_order.id)
    user_for_order.default_shipping = user_for_order.default_billing = default.id
    user_for_order.save
  end
end

scale.times do
  o = Order.new
  user_for_order = User.all.sample
  o.user_id = user_for_order.id
  o.save

  (rand(3) + 1).times do
    kart_item = Item.new
    kart_item.order_id = o.id
    kart_item.product_id = Product.all.sample.id
    kart_item.quantity = rand(4) + 1
    kart_item.unit_price = Product.find(kart_item.product_id).price
    kart_item.save
  end


  payment = Payment.new
  payment.user_id = user_for_order.id
  payment.name = user_for_order.first_name
  payment.cc_number = Faker::Business.credit_card_number
  payment.expiration = Faker::Business.credit_card_expiry_date
  payment.location_id = user_for_order.default_billing
  payment.save
  o.payment_id = payment.id
  o.billing_location_id = payment.location_id
  o.save

  shipment = Shipment.new
  shipment.to_location = user_for_order.default_shipping
  shipment.from_location = warehouse.id
  shipment.order_id = o.id
  shipment.save

end

def create_payment(user)
  payment = Payment.new
  payment.user_id = user.id
  payment.name = user.first_name
  payment.cc_number = Faker::Business.credit_card_number
  payment.expiration = Faker::Business.credit_card_expiry_date
  payment.location_id = user.default_billing
  payment.save
end

order = Order.first
order.open_order = false
order.save

order2 = Order.last
order2.open_order = false
order2.save

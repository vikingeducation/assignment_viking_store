# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
warehouse = Location.new
warehouse.state = Faker::Address.state_abbr
warehouse.street = Faker::Address.street_address
warehouse.city = Faker::Address.city
warehouse.zip = Faker::Address.zip
warehouse.save

states = Array.new
10.times { states << Faker::Address.state_abbr }
states.uniq.each { |state| State.create(abbr: state)}

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
  product.sku = rand(897) + 1
  product.save
end

100.times do |i|
  u = User.new
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.phone = Faker::PhoneNumber.phone_number
  u.email = Faker::Internet.email
  time_for_save = Faker::Time.backward(365, :all)
  u.created_at = time_for_save
  u.save
end

100.times do |i|
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

  user_for_order.default_shipping ||= l.id
  user_for_order.default_billing ||= l.id
  user_for_order.save

    kart_item = Item.new
    kart_item.order_id = o.id
    kart_item.product_id = Product.all.sample.id
    kart_item.quantity = rand(4) + 1
    kart_item.unit_price = Product.find(kart_item.product_id).price
    kart_item.save



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

order = Order.first
order.open_order = false
order.save

order2 = Order.last
order2.open_order = false
order2.save

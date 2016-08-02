# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    # t.string   "title"
    # t.text     "description"
    # t.string   "price"
    # t.string   "sku"

# delete

User.destroy_all
Product.destroy_all
CreditCard.destroy_all
Address.destroy_all
Order.destroy_all
Category.destroy_all
PhoneNumber.destroy_all
Shipment.destroy_all



10.times do
  User.create(name: Fake::Name.name, email: Faker::Internet.email)
end

10.times do
  Product.create(title: Faker::Beer.name, description: Faker::Beer.style, price: Faker::Commerce.price , sku: Faker::Number.number(10) )
end

10.times do
  Product.create(title: Faker::Pokemon.name , description: Faker::Pokemon.location, price: Faker::Commerce.price , sku: Faker::Number.number(10) )
end

20.times do
  Address.create(location: Faker::Address.street_address)
end

user_array = User.select('id').to_a
10.times do
  id = user_array.sample.id
  CreditCard.create(number: Faker::Business.credit_card_number, user_id: id)
end

10.times do
  Catagory.create(type: Faker::Color.color_name)
end

10.times do
  PhoneNumber.create(number: Faker::PhoneNumber.phone_number)
end

address_array = Address.select('id').to_a
10.times do
  id = address_array.sample.id
  Shipments.create(address_id: id)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

address_arr = []

50.times do
  b = Address.new
  b.location = Faker::Pokemon.location
  b.zip = Faker::Address.zip_code
  b.city =Faker::Address.city
  b.state = Faker::Address.state
  address_arr << b
  b.save
end

25.times do
  a = User.new
  a.name = Faker::Name.name
  a.phone = Faker::PhoneNumber.phone_number
  a.email = Faker::Internet.email
  a.credit_card = Faker::Code.ean #yeah treat this as creditcardnumber
  a.billing_id = address_arr.shift.id
  a.address_id = address_arr.sample.id
  a.save
end


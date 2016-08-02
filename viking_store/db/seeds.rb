# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  b = Address.new
  b.location = Faker::Pokemon.location
  b.zip = Faker::Address.zip_code
  b.city =Faker::Address.city
  b.state = Faker::Adresss.state
  b.save
end

50.times do
  a = User.new
  a.name = Faker::Name.name
  a.phone = Faker::PhoneNumber.phone_number
  a.email = Faker::Internet.email
  a.credit_card = Faker::Code.ean #yeah treat this as creditcardnumber
  a.save
end


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


10.times do 
  User.find_or_create_by(name: Fake::Name.name, email: Faker::Internet.email)
end

10.times do 
  Product.find_or_create_by(title: Faker::Beer.name, description: Faker::Beer.style, price: Faker::Commerce.price , sku: Faker::Number.number(10) )
end

10.times do 
  Product.find_or_create_by(title: Faker::Pokemon.name , description: Faker::Pokemon.location, price: Faker::Commerce.price , sku: Faker::Number.number(10) )
end
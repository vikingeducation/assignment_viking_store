# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |n|
    p = Product.new
    p.title =  Faker::Beer.name 
    p.description =  Faker::Hipster.sentence 
    p.price = Faker::Commerce.price 
    p.sku  = Faker::Number.number(10)
    

    p.save
end
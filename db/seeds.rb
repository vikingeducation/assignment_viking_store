# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# clear all the data
User.destroy_all
UserDetail.destroy_all
ShoppingCart.destroy_all
Product.destroy_all
Order.destroy_all
CreditCard.destroy_all
Category.destroy_all
CartProduct.destroy_all
Address.destroy_all

# generate basic users
10.times do
  name = Faker::Name.name
  email = Faker::Internet.email("#{name}")
  user = User.create(:email => email, :name => name )

  phone_number = Faker::PhoneNumber.cell_phone
  user.user_details.create(:phone_number => phone_number)

  
end

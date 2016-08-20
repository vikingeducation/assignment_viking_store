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
  user = User.create(
  :email => email,
  :name => name
  )

  # add PhoneNumber
  phone_number = Faker::PhoneNumber.cell_phone
  user.user_details.create(
  :phone_number => phone_number
  )

  # add credit_cards
  3.times do
    credit_card_number = Faker::Business.credit_card_number
    expire_date = Faker::Business.credit_card_expiry_date
    user.user_details.first.credit_cards.create(
    :card_number => credit_card_number,
    :mvc_number => rand(100..999).to_s,
    :expire_date => expire_date
    )
  end

  # add addresses
  5.times do
    country = Faker::Address.country
    province = Faker::Address.state
    city = Faker::Address.city
    postcode = Faker::Address.postcode
    address_1 = Faker::Address.street_address
    address_2 = Faker::Address.secondary_address
    user.user_details.first.addresses.create(
    :country => country,
    :province => province,
    :city => city,
    :postcode => postcode,
    :address_1 => address_1,
    :address_2 => address_2,
    )
    user.user_details.first.addresses.first.billing_default = true
    user.user_details.first.addresses.first.shipping_default = true
  end

end

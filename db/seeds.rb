# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'Faker'

# seed multiplier

n = 1

# populate 100 users over the last year

User.destroy_all

(n * 100).times do |i|
  User.create!(
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.unique.email,
                created_at: Faker::Date.between(1.year.ago, Date.today)
              )
end

p "Created #{User.count} Users"

# populate 100 cities

City.destroy_all

(n * 100).times do |i|
  City.create!(
                name: Faker::Address.unique.city
              )
end

p "Created #{City.count} Cities"

# populate all States

State.destroy_all


50.times do |i|
  State.create!(
                  abbr: Faker::Address.unique.state_abbr
                )
end

p "Created #{State.count} States"

# create 6 categories

Category.destroy_all


(n * 6).times do |i|
  Category.create!(
                    name: Faker::Commerce.unique.department,
                    description: Faker::Simpsons.unique.quote
                  )
end

p "Created #{Category.count} Categories"

# create 30 products

Product.destroy_all

(n * 30).times do |i|
  Product.create!(
                    category_id: Faker::Number.between(1,(n * 6)),
                    title: Faker::Commerce.unique.product_name,
                    description: Faker::RickAndMorty.unique.quote,
                    price: Faker::Commerce.price,
                    sku: Faker::Code.unique.asin
                    )
end

p "Created #{Product.count} Products"

# populate 0-5 addresses per user, one default to shipping/billing

Address.destroy_all

(n * 200).times do |i|
  Address.create!(
                    street: Faker::Address.street_address,
                    city_id: Faker::Number.between(1,(n * 100)),
                    state_id: Faker::Number.between(1,50),
                    zip: Faker::Address.zip_code
                  )
end

p "Created #{Address.count} Addresses"

# 25 active shopping carts

Cart.destroy_all

(n * 25).times do |i|
  Cart.create!(
                user_id: Faker::Number.unique.between(1,(n *25)),
                product_id: Faker::Number.unique.between(1,(n * 30)),
                quantity: Faker::Number.between(1,10)
              )
end

(n * 100).times do |i|
  Cart.create!(
                user_id: Faker::Number.between((n * 26),(n * 100)),
                product_id: Faker::Number.between(1,(n * 30)),
                quantity: Faker::Number.between(1,10),
                created_at: Faker::Date.between(1.year.ago, Date.today),
                active: false
              )
end

p "Created #{Cart.count} Carts"



# historical data - populate 100 orders over the last year

Order.destroy_all

(n * 100).times do |i|
  Order.create!(
                  cart_id: Faker::Number.unique.between((n * 26), (n * 125)),
                  phone:  Faker::PhoneNumber.phone_number,
                  cc: Faker::Business.credit_card_number,
                  cc_expiration: Faker::Business.credit_card_expiry_date,
                  type_of_card: Faker::Business.credit_card_type,
                  shipping_address_id: Faker::Number.between(1,(n * 200)),
                  billing_address_id: Faker::Number.between(1,(n * 200)),
                  created_at: Faker::Date.between(1.year.ago, Date.today)
                )
end

p "Created #{Order.count} Orders"

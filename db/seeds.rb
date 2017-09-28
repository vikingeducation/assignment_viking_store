# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker/name'
require 'faker/internet'
require 'faker/address'

def create_user_and_cart(join_date)
  User.create first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.safe_email,
              created_at: join_date,
              updated_at: join_date,
              cart: Cart.create(created_at: join_date, updated_at: join_date)
end

###########################
# Create users with carts #
###########################

date = 12.months.ago.to_time

10.times do
  create_user_and_cart(date)
  date += rand(1..4) * 7 * 24 * 60 * 60
end

40.times do
  create_user_and_cart(date)
  date += rand(1..4) * 24 * 60 * 60
end

60.times do
  create_user_and_cart(date)
  date += rand(12..24) * 60 * 60
end



# shipping_address = Address.create street_1: Faker::Address.street_address,
#                                   city: Faker::Address.city,
#                                   state: Faker::Address.state_abbr,
#                                   post_code: Faker::Address.postcode
#
# billing_address = Address.create street_1: Faker::Address.street_address,
#                                  city: Faker::Address.city,
#                                  state: Faker::Address.state_abbr,
#                                  post_code: Faker::Address.postcode,
#                                  addr_type: :billing
#
# u.user_addresses.create(address_id: shipping_address.id, default_address: true)
# u.user_addresses.create(address_id: billing_address.id, default_address: true)
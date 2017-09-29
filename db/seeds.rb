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
require 'faker/commerce'
require 'faker/business'
require 'faker/lorem'
require 'faker/the_fresh_prince_of_bel_air'

def add_default_addresses(user, city)
  shipping_address = Address.create street_1: Faker::Address.street_address,
                                    city: city,
                                    state: city.state,
                                    post_code: Faker::Address.postcode

  billing_address = Address.create street_1: Faker::Address.street_address,
                                   city: city,
                                   state: city.state,
                                   post_code: Faker::Address.postcode,
                                   addr_type: :billing

  user.user_addresses.create(address_id: shipping_address.id, default_address: true)
  user.user_addresses.create(address_id: billing_address.id, default_address: true)
end

def add_extra_shipping_address(user, city)
  num_to_add = rand(0..3)
  return if num_to_add == 0

  num_to_add.times do
    create_shipping_address_for(user, city)
  end
end

def create_shipping_address_for(user, city)
  address = Address.create street_1: Faker::Address.street_address,
                           city: city,
                           state: city.state,
                           post_code: Faker::Address.postcode

  user.user_addresses.create(address_id: address.id, default_address: false)
end

def create_user_and_cart(join_date)
  User.create first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.safe_email,
              joined_at: join_date,
              cart: Cart.create(created_at: join_date, updated_at: join_date)
end

def date_from_and_to(start_date, end_date)
  Time.at((end_date.to_f - start_date.to_f) * rand + start_date.to_f)
end

puts "\n Randomizing users, giving them shopping carts\n"
###########################
# Create users with carts #
###########################

# 11 to 12 months ago
date_1 = 12.months.ago.to_time
date_2 = 10.months.ago.to_time

5.times do
  random_date = date_from_and_to(date_1, date_2)
  create_user_and_cart(random_date)
end

# 9 to 10 months ago
date_1 = 10.months.ago.to_time
date_2 = 8.months.ago.to_time

10.times do
  random_date = date_from_and_to(date_1, date_2)
  create_user_and_cart(random_date)
end

# 7 to 8 months ago
date_1 = 8.months.ago.to_time
date_2 = 6.months.ago.to_time

15.times do
  random_date = date_from_and_to(date_1, date_2)
  create_user_and_cart(random_date)
end

# 5 to 6 months ago
date_1 = 6.months.ago.to_time
date_2 = 4.months.ago.to_time

20.times do
  random_date = date_from_and_to(date_1, date_2)
  create_user_and_cart(random_date)
end

# 3 to 4 months ago
date_1 = 4.months.ago.to_time
date_2 = 2.months.ago.to_time

30.times do
  random_date = date_from_and_to(date_1, date_2)
  create_user_and_cart(random_date)
end

# 2 months ago
date_1 = 2.months.ago.to_time
date_2 = 1.month.ago.to_time

40.times do
  random_date = date_from_and_to(date_1, date_2)
  create_user_and_cart(random_date)
end

# last month
date_1 = 1.month.ago.to_time
date_2 = Date.today.to_time

50.times do
  random_date = date_from_and_to(date_1, date_2)
  create_user_and_cart(random_date)
end

USER_COUNT = User.count

puts "\n Creating the world, randomizing cities and states\n"
############################
# Create cities and states #
############################
colorado = State.create name: 'Colorado', abbrev: 'CO'
california = State.create name: 'California', abbrev: 'CA'
florida = State.create name: 'Florida', abbrev: 'FL'
washington = State.create name: 'Washington', abbrev: 'WA'
oregon = State.create name: 'Oregon', abbrev: 'OR'

State.all.each do |state|
  25.times do
    state.cities.create name: Faker::Address.city
  end
end

CITY_COUNT = City.count

puts "\n Giving the denizens homes to live in\n"
####################
# Create addresses #
####################
popular_city_ids = []

while popular_city_ids.length != 5
  popular_city_ids << rand(1..CITY_COUNT)
  popular_city_ids.uniq!
end

# more addresses for a few cities
used_user_ids = []

City.find(popular_city_ids).each do |city|
  id = nil
  15.times do
    loop do
      id = rand(1..USER_COUNT)
      break unless used_user_ids.include? id
    end

    random_user = User.find(id)
    used_user_ids << random_user.id
    add_default_addresses(random_user, city)
    add_extra_shipping_address(random_user, city)
  end
end

User.all.each do |user|
  next if used_user_ids.include? user.id
  next unless rand(1..3) == 1

  used_user_ids << user.id
  random_city = City.find(rand(1..CITY_COUNT))

  add_default_addresses(user, random_city)
  add_extra_shipping_address(user, random_city)
end

puts "\n Products and categories are random; spend lots of money\n"
#########################################################
# Create products and categories; put them in the carts #
#########################################################

6.times do
  category = Category.create name: Faker::Commerce.department,
                             description: Faker::Lorem.paragraph

  5.times do
    category.products.create title: Faker::Commerce.product_name,
                             description: Faker::TheFreshPrinceOfBelAir.quote,
                             price: Faker::Commerce.price,
                             sku: Faker::Commerce.promotion_code
  end
end

PRODUCT_COUNT = Product.count

User.order('RANDOM()').limit(30).each do |user|
  rand(1..5).times do
    user.cart.product_carts.create product_id: rand(1..PRODUCT_COUNT)
  end
end

puts "\n Creating orders--the smell of commerce in the morning"
#################
# Create orders #
#################

# user.orders.create(
#        cart: user.cart,
#        billing_address: user.billing_address,
#        shipping_address: user.shipping_address,
#        created_at: user.join_date
# )


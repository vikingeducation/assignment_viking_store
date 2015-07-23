# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MULTIPLIER = 1

city_name = Array.new(100){Faker::Address.city}
state_name = Array.new(10){Faker::Address.state}

def create_users(start_date, end_date)
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name  , email: Faker::Internet.email, created_at: Faker::Date.between(start_date, end_date))
end

def create_address
  Address.create(street: Faker::Address.street_address, city: city_name.sample, state: state_name.sample, zip_code: Faker::Address.zip_code)
end

def credit_card_num
   Faker::Business.credit_card_number.split("-").join("").to_i
end


def create_billing(user_num, address_num)
  Billing.create(user_id: user_num, address_id: address_num, cc_num: credit_card_num, cc_type: Faker::Business.credit_card_type, cc_exp: Faker::Business.credit_card_expiry_date)
end

Rake::Task['db:reset'].invoke

#staggers more users towards now
(MULTIPLIER*2).times do |i|
  create_users(3.years.ago, 2.years.ago)
  2.times {create_users(2.years.ago, 1.years.ago)}
  3.times {create_users(1.years.ago, Time.now)}
end

#0-5 addresses for users
# default for shipping if selected
# user-address table first??
# generate address first??? address table


# method to randomly assign users a # of addresses???








#~6 categories
cat_size = 6
cat_size.times {Categories.create(Faker::Commerce.department)}

#10-30 products/category
#make product
def product_for_category(cat_id)
  rand(10..30).times do |i|
    Product.new(name: Faker::Commerce.product_name, category_id: cat_id, price: Faker::Commerce.price, description: "some description", stock: rand(0..100))
end

#populates category with products
cat_size.downto(1) { |num| product_for_category(num) }

#100 orders in past year (growth rate)

#25 shopping carts
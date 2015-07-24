# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Rake::Task['db:drop'].invoke

MULTIPLIER = 1

CITY_NAME = Array.new(100){Faker::Address.city}
STATE_NAME = Array.new(10){Faker::Address.state}

def create_users(start_date, end_date)
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name  , email: Faker::Internet.email, created_at: Faker::Date.between(start_date, end_date))
end

def create_address
  Address.create(street: Faker::Address.street_address, city: CITY_NAME.sample, state: STATE_NAME.sample, zip_code: Faker::Address.zip_code)
end

# def credit_card_num
#    Faker::Business.credit_card_number.split("-").join("").to_i
# end


def create_billing(user_num, address_num)
  Billing.create(user_id: user_num, address_id: address_num, cc_number: Faker::Business.credit_card_number, cc_type: Faker::Business.credit_card_type, cc_exp: Faker::Business.credit_card_expiry_date)
end



#staggers more users towards now
(MULTIPLIER*2).times do |i|
  create_users(3.years.ago, 2.years.ago)
  2.times {create_users(2.years.ago, 1.years.ago)}
  3.times {create_users(1.years.ago, Time.now)}
end


(MULTIPLIER * 15).times do |address|
  create_address
end


#creates user address join table
#0-5 addresses for users
users = User.all
addresses = Address.all
users.each do |user|
  user_num_addy = rand(0..5)
  user_addy = addresses.sample(user_num_addy)
  user_num_addy.times do |i|
    UserAddress.create(user_id: user.id, address_id: user_addy[i].id)
    user.default_shipping ||= user_addy[i].id
  end
end

#assume 1cc per user, only if user has address on file
users.each do |user|
  if UserAddress.find(user.id)
    address_num = UserAddress.find(user.id).address_id
    create_billing(user.id, address_num)
  end
end

#~6 categories
cat_size = 6
cat_size.times {Category.create(name: Faker::Commerce.department)}

#10-30 products/category
#make product
def product_for_category(cat_id)
  rand(10..30).times do |i|
    Product.create(name: Faker::Commerce.product_name, category_id: cat_id, price: Faker::Commerce.price, description: "some description", stock: rand(0..100))
  end
end

#populates category with products
cat_size.downto(1) { |num| product_for_category(num) }

products = Product.all
#create order first, then packinglist

def user_make_order(userid)
  user_order = Order.create(user_id: userid, checkout: Faker::Date.between(1.years.ago, Time.now))
  PackingList.create(product_id: products.sample.id, order_id: user_order.id, quantity: rand(1..10))
end

#100 orders in past year (growth rate)
100.times do
  customer = users.sample.id
  #if user has no CC on file, find another
  until Billing.find_by(:user_id => customer)
    user_make_order(users.sample.id)
    customer = users.sample.id
  end
end



#25 shopping carts
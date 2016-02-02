# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Have at least 100 users. Stagger their join dates any time in the last year. Show growth in the rate of user signups over time.

require 'faker'

seed_multiplier = 1

users = []
(100*seed_multiplier).times do |user|
  users << User.create([{first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_num: Faker::PhoneNumber.phone_number, email: Faker::Internet.email])
end

users.each do |user|
  addresses = []
  type = ["billing", "shipping"]
  boolean = ["true", "false"]
  5.times do |address|
    addresses << Address.create([{user_id: , address_type: type.sample , billing_address_default: boolean.sample , shipping_address_default: boolean.sample, number:, street1: Faker::Address.street_address, street2: Faker::Address.secondary_address, state_id: Faker::Address.state, zip_code: Faker::Address.zip_code, credit_card_id:}])

    state_name = {Alabama => 'AL', Alaska => 'AK', Arizona => 'AZ', Arkansas => 'AR', California => 'CA' }
    states = State.create([{name: state_name.name.sample, abbreviation: state_name.abr}])
  

  end

end


(6*seed_multiplier).times do |category|
categories = Category.create([{name: Faker::Commerce.product_name, description:Faker::Lorem.sentence}])
  
  products = []
  (5*seed_multiplier).times do |product|
    products << Product.create([{name: Faker::Commerce.product_name, description:Faker::Lorem.sentence, price: Faker::Commerce.price, sku:Faker::Number.number(10)}])
  end
  #need another migration to add category id to product
end

orders = []
order_months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
order_multiplier = 1

order_months.each do |order_month|
  (3*order_multiplier).times do 
    orders << Order.create([{user_id: users.sample, order_date: "2015-" + order_month + "-01" , order_status:}])  
  end
  order_multiplier += 1
end

(25*seed_multiplier).times do |order_products|
  order_products = Product_Order.create([{product_id: products.sample, order_id: orders.sample, quantity:Faker::Number.number(1)}])
end

credit_cards = Credit_Cards.create([{cc_num:Faker::Business.credit_card_number , expiry_year:, expiry_month:Faker::Business.credit_card_expiry_date, security_code: Faker::Number.number(3), user_id}])

  











   


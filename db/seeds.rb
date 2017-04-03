# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MULTIPLIER = 4

puts "Starting seeds...\n\n"
start_time = Time.now

puts "Removing old data..."
User.delete_all
Customer.delete_all
Product.delete_all
Address.delete_all
Category.delete_all
City.delete_all
State.delete_all
Cart.delete_all
Order.delete_all
CustomerAddrRef.delete_all
CustomerAddrTypeRef.delete_all
puts "Old data removed.\n\n"

puts "Creating users..."

num_users = MULTIPLIER * 25
total_users = 0

num_users.times do
  User.create(
    nickname: Faker::Internet.user_name,
    email: Faker::Internet.email
    )
  total_users += 1
end

puts "#{total_users} users created."


puts "Creating customers..."
total_customers = 0

User.all.each do |user|
  next if 1 < rand(0..4)
  Customer.create(
    user_id: user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_no: Faker::PhoneNumber.cell_phone,
    credit_card: Faker::Business.credit_card_number,
    def_shipping_address: !!!!!!!!,
    def_billing_address: !!!!!!!!!!!
  )

  total_customers += 1
end
puts "#{total_customers} customers created."


puts "Creating addresses..."
total_addresses = 0

(num_users + MULTIPLIER*2).times do |user|
  Address.create(
    state_id: State.pluck(:id).sample,
    city_id: City.pluck(:id).sample,
    street: Faker::Address.street_name,
    home_no: Faker::Address.building_number,
    post_code: Faker::Address.postcode
    )
end
puts "#{total_addresses} addresses created."



puts "Creating products..."
total_products = 0
num_products = MULTIPLIER * 8

num_products.times do
  Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraphs,
    price: rand(60..600).round(2),
    sku_no: ('0'..'z').to_a.shuffle.first(8).join,
    category_id: Category.pluck(:id).sample
    )

  total_products += 1
end
puts "#{total_products} products created."


puts "Creating categories..."
total_categories = 0

(total_products/4).times do
  Category.create(
    description: Faker::Commerce.department
  )
  total_categories += 1
end

puts "#{total_categories} categories created."




puts "Creating cities..."
num_cities = MULTIPLIER * 25
total_cities = 0

num_cities.times do
  City.create(
    name: Faker::Address.city
    )

  total_cities += 1
end

puts "#{total_cities} cities created."


puts "Creating states..."
num_states = MULTIPLIER * 3
total_states = 0

num_states.times do
  State.create(
    name: Faker::Address.state
    )

  total_states += 1
end

puts "#{total_states} states created."



puts "Creating carts..."
num_of_carts = MULTIPLIER * 6
total_carts = 0

num_of_carts.times do
  Cart.create(
    customer_id: City.pluck(:id).sample
  )

  total_carts += 1
end

puts "#{total_carts} shopping carts created."



puts "Creating carts_details ..."
total_carts_details = 0

Cart.all.each do |cart|
  num_of_products = rand(1..5)
  num_of_products.times do
    CartDetail.create(
      cart_id: cart.id,
      product_id: City.pluck(:id).sample,
      quantity: rand(1..6)
    )
    total_carts_details += 1
  end
end

puts "#{total_carts_details} product entries created in all shopping carts."



puts "Creating orders..."
puts "Creating address types..."
puts "Creating customer address references..."
puts "Creating customer address types references..."





puts "\n\nDatabase is seeded now!!!"
puts "It took #{Time.now - start_time} seconds."


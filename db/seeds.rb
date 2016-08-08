# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



SAMPLE = 100
STATES_NUM = 10
E = 2.7182
K = 0.0126

puts "Starting seeds...\n\n"
start_time = Time.now

puts "Removing old data..."
# Blow away the existing data
User.delete_all
Address.delete_all
Card.delete_all
Product.delete_all
Category.delete_all
CartItem.delete_all
OrderItem.delete_all
Order.delete_all
puts "Old data removed.\n\n"

puts "Creating Cities/States..."
STATES_NUM.times do
  State.create( name: Faker::Address.state )
end

State.all.each do |state|
  SAMPLE/STATES_NUM.times do
    City.create( name: Faker::Address.city, state_id: state.id )
  end
end
puts "Cities/States created.\n\n"

puts "Creating Users...\n\n"
SAMPLE.times do
  User.create( first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                phone: Faker::PhoneNumber.phone_number )
end
puts "Users created.\n\n"

puts "Creating Addresses...\n\n"
User.all.each do |user|
  rand(5).times do |i|
    Address.create( user_id: user.id,
                    street_address: Faker::Address.street_address+Faker::Address.street_suffix,
                    city: City.all.sample.id,
                    zip: Faker::Address.zip)
    if i == 0
      user.bill_id = Address.last.id
      user.ship_id = Address.last.id
    elsif i == 1
      user.ship_id = Address.last.id
    end
  end
end
puts "Addresses created...\n\n"

puts "Creating CCs...\n\n"
User.all.each do |user|
  unless user.bill_id.nil?
    Card.create( user_id: user.id,
                 date: Faker::Business.credit_card_expiry_date,
                 number: Faker::Business.credit_card_number)
  end
end
puts "CCs created.\n\n"

puts "Creating Products/Categories"
SAMPLE/15.times do |i|
  Category.create(name: Faker::Commerce.department,
                  description: Faker::Lorem.sentence(1))
end

SAMPLE/5.times do |i|
  Product.create( title: Faker::Commerce.product_name,
                  description: Faker::Lorem.sentence(2),
                  price: Faker::Commerce.price,
                  sku: Faker::Code.isbn[0..-3].to_i,
                  category_id: Category.all.sample.id)
end
puts "Products/categories created\n\n"

puts "Creating Order/order items...\n\n"
SAMPLE.times do |i|
  user = User.all.sample
  Order.create( user_id: user.id,
                bill_id: user.bill_id,
                ship_id: user.ship_id,
                card_id: user.card_id)
end

Order.all.each do |order|
  subtotal = 0
  order_size = rand(5)+1
  prods = Product.all.sample(order_size)
  prods.each do |product|
    OrderItem.create(order_id: order.id,
                     product_id: product.id,
                     quantity: rand(3)+1)
    subtotal += product.price
  end
  order.subtotal = subtotal
end
puts "Created orders/order items\n\n"

puts "Creating carts/cart items \n\n"
users = User.all.sample(SAMPLE/4)
users.each do |user|
  cart = Product.all.sample(rand(5)+1)
  cart.each do |product|
    CartItem.create( user_id: user.id,
                      product_id: product.id,
                      quantity: rand(3)+1)
  end
end
puts "carts/cart items created \n\n"

puts "distributing user join and order dates...\n\n"
date_range = (Time.now-1.year..Time.now-3.hours)
days = []
365.times do |day|
  E**(day*K).round.times do
    days << Time.now-(364-day).days
  end
end
User.all.each do |user|
  user.update(created_at: days.sample)
end
Order.all.each do |order|
  order.update(created_at: rand(User.find(order.user_id).created_at..Time.now))
end
puts "distribution complete.\n\n"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def fib(n)
  arr = [1, 2]
  until arr.reduce(:+) >= n
    arr << arr[-1] + arr[-2]
  end
  arr
end

def staggered(dist, time)
  x = 0
  dist.each_with_index do |n, i|
    n.times do
      yield(i, x)
    end
  end
end

timer_start = Time.new

MULTPLIER = 1

puts "Clearing existing data..."
OrderItem.delete_all
Address.delete_all
State.delete_all
City.delete_all
Country.delete_all
Product.delete_all
Category.delete_all
CreditCard.delete_all
Order.delete_all
User.delete_all

MULTIPLIER = 1

# Set up time frame
START_TIME = Time.find_zone("Asia/Singapore").local(2016, 1, 1)
END_TIME = Time.find_zone("Asia/Singapore").local(2016, 12, 31)
TIME_FRAME = END_TIME - START_TIME

# Add cities
puts "Creating cities..."
(MULTIPLIER * 50).times do |i|
  City.create(name: Faker::Address.city)
end

# Create countries
puts "Creating countries..."
(MULTIPLIER * 100 + rand(10..20)).times do |i|
  Country.create(name: Faker::Address.country)
end

# Create States
puts "Creating states..."
(rand(5..10)).times do |i|
  State.create(name: Faker::Address.state)
end


# Add users
puts "Creating users..."
user_count = MULTIPLIER * 25
days = TIME_FRAME / 60 / 60 / 24 / fib(user_count).size
distribution = fib(user_count)
staggered(distribution, days) do |i, x|
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  created = START_TIME + rand(days  * i ..days  * (i + 1)).day + rand(days *i).minute
  u = User.create(email: Faker::Internet.email( "#{first} #{last}"),
                  last_name: last,
                  first_name: first,
                  created_at: created
                  )
  x += 1
  return if x == user_count
end

# Add Credit Cards
puts "Creating credit cards and addresses..."
User.all.each do |user|
  rand(5).times do
    Address.create!( full_name: "#{user.first_name} #{user.last_name}",
                     add_line1:   Faker::Address.street_address,
                     add_line2: "#{ rand(1) ? Faker::Address.secondary_address : '' }",
                     zip: Faker::Address.postcode,
                     city_id: City.pluck(:id).sample,
                     state_id: State.pluck(:id).sample,
                     country_id: Country.pluck(:id).sample,
                     user_id: user.id
                     )

    CreditCard.create!( user_id: user.id,
                        full_name: "#{user.first_name} #{user.last_name}",
                        number: Faker::Business.credit_card_number,
                        card_type: Faker::Business.credit_card_type,
                        exp_month: rand(1..12),
                        exp_year: rand(timer_start.year..(timer_start.year+5)),
                        billing_address_id: user.addresses.sample.id
                        ) if user.addresses.sample.id
  end
end

# Create categories
puts "Creating categories..."
(MULTIPLIER * 7).times do |i|
  Category.create( name: Faker::Commerce.department(1, true),
                   description: Faker::Lorem.sentence(5, true, 5)
                   )
end


# Create Products
puts "Creating products..."
(MULTIPLIER * 20).times do |i|
  Product.create( name: Faker::Commerce.product_name,
                  description: Faker::Lorem.sentence(5, true, 5),
                  price: Faker::Commerce.price,
                  sku: Faker::Number.number(10).to_s,
                  quantity: MULTIPLIER * rand(1..7),
                  category_id: Category.pluck(:id).sample
                  )
end

# Create orders
puts "Creating historical orders..."
order_count = MULTIPLIER * 100
distribution = fib(order_count)
days = TIME_FRAME / 60 / 60 / 24 / fib(order_count).size
staggered(distribution, days) do |i, x|
  user = User.find(User.pluck(:id).sample)
  date = START_TIME + rand(days * i ..days * (i + 1)).day + rand(days*i).minute
  unless user.addresses.empty?
    Order.create!( user_id: user.id,
                   billing_address_id: user.addresses.sample.id,
                   shipping_address_id: user.addresses.sample.id,
                   checkout: date,
                   created_at: user.created_at + rand(END_TIME.day-user.created_at.day).day
                   )
  end
  return if x == order_count
end

# Create active shopping carts
puts "Creating active shopping carts..."
(MULTIPLIER * 25 + rand(15)).times do
  user = User.find(User.pluck(:id).sample)
  checkout = user.orders.any?{ |o| o.checkout } ? END_TIME - rand(30).day - rand(360).minute : nil
  Order.create!( user_id: user.id,
                 billing_address_id: user.addresses.sample.id,
                 shipping_address_id: user.addresses.sample.id,
                 checkout: checkout,
                 created_at: checkout
                 ) unless user.addresses.empty?
end

# Add products to order
puts "Adding products to orders..."
Order.all.each do |order|
  rand(3).times do
    OrderItem.create( product_id: Product.pluck(:id).sample,
                      order_id: Order.pluck(:id).sample,
                      quantity: rand(1..5)
                      )
  end
end

# Add default addresses
puts "Setting up default addresses..."
User.all.each do |user|
  next if user.orders.empty?
  DefaultAddress.create( user_id: user.id,
                         billing_id: user.orders.first.billing_address_id,
                         shipping_id: user.orders.first.shipping_address_id
                         )
end

puts "Seeding completed in #{((Time.new - timer_start).second).round(1)}s"

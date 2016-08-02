# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Starting seeds...\n\n"
start_time = Time.now

puts "Removing old data..."
# Blow away the existing data
Address.delete_all
Category.delete_all
CreditCard.delete_all
Order.delete_all
PhoneNum.delete_all
Product.delete_all
User.delete_all
puts "Old data removed.\n\n"

# increase your seed size by changing this
# NOTE: This can make it take MUCH longer!
# A value of 10 can take over 3 minutes
MULTIPLIER = 1

# Addresses
POPULAR_CITIES=[]
CITIES = []
STATES = []
20.times do
  POPULAR_CITIES << Faker::Address.city
  CITIES << Faker::Address.city
end
CITIES += POPULAR_CITIES*4
10.times do
  STATES << Faker::Address.state
end

puts "Creating addresses..."
MULTIPLIER*300.times do
  print "\r" + '.'
  Address.create(user_id: 0, num_street: Faker::Address.street_address, city: CITIES.sample, state: STATES.sample, country: "USA", zip: Faker::Address.zip, shipping: false, billing: false)
end

Address.all.each do |address|
  address.update(:shipping => [true,false].sample)
  if address.shipping
    address.update(:billing => [true, false].sample)
  else
    address.update(:billing => true)
  end
end
puts "Addresses created.\n\n"

# Credit Cards
puts "Creating credit cards..."

(MULTIPLIER * 200).times do
  print "\r" + '.'
  CreditCard.create(user_id: 0,
                    number: Faker::Business.credit_card_number,
                    exp_date: Faker::Business.credit_card_expiry_date,
                    security_code: Faker::Number.number(3),
                    billing_address_id: 0,
                    card_type: Faker::Business.credit_card_type)
end
puts "Credit cards created.\n\n"

# Phone Numbers
puts "Creating phone nums.."

(MULTIPLIER * 100).times do
  PhoneNum.create(user_id: 0,
                  number: Faker::PhoneNumber.cell_phone,
                  num_type: ['mobile', 'home', 'work'].sample)
end

# Categories

puts "Creating categories.."

CATEGORIES = { "food" => "all food, from pizza to hot dogs to vegetables",
            "clothes" => "many many different types of clothes for many many different types of people",
            "home" => "things to make your home nice",
            "bathroom" => "to make your bathroom better",
            "sports" => "everything so you can play any sport you want",
            "electronics" => "all the electronics you need" }

CATEGORIES.each do |name, description|
  Category.create(name: name, description: description)
end
puts "Categories created.\n\n"

# Products

puts "Creating products.."

(MULTIPLIER * 30).times do
  print "\r" + '.'
  Product.create(title:Faker::Commerce.product_name,
                  description: Faker::Lorem.sentence,
                  price: Faker::Commerce.price,
                  sku: Faker::Number.number(15),
                  category_id: Category.select("id").sample.id,
                  amt_in_stock: Faker::Number.between(20,100)

    )
end
puts "Products created.\n\n"

puts "Creating orders.."

(MULTIPLIER * 100).times do |time|
  print "\r" + '.' * time
  Order.create(user_id: 0,
              shipping_address_id: 0,
              credit_card_id: 0,
              phone_num_id: 0,
              confirmed: [true, true, false].sample
                )
end

Order.all.each_with_index do |order, index|
  if order.confirmed
    if index.between?(0, Order.count/2)
      order.update(order_date: Faker::Date.between(1.month.ago,Date.today))
    elsif index.between?(Order.count/2,(3*Order.count)/4)
      order.update(order_date: Faker::Date.between(6.months.ago,1.month.ago))
    else
      order.update(order_date: Faker::Date.between(1.year.ago, 6.months.ago))
    end
  end
end
puts "Orders created.\n\n"

# Users

puts "Creating users.."

(MULTIPLIER * 100).times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
              email: Faker::Internet.email)
end

User.all.each_with_index do |user, index|
  if index.between?(0, User.count/2)
    user.update(join_date: Faker::Date.between(1.month.ago, Date.today))
  elsif index.between?(User.count/2,(3 * User.count)/4)
    user.update(join_date: Faker::Date.between(6.months.ago,1.month.ago))
  else
    user.update(join_date: Faker::Date.between(1.year.ago, 6.months.ago))
  end
end

# Add user_id to addresses
USER_IDS = User.select(:id).to_a
Address.all.each do |address|
  user_id = USER_IDS.sample
  address.update(user_id: user_id)

  if address.shipping
    User.find(user_id).update(:default_ship_address_id, address.id)
end







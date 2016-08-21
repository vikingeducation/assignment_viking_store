# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying old records..."

User.destroy_all
Address.destroy_all
Order.destroy_all
OrderContent.destroy_all
Category.destroy_all
CreditCard.destroy_all
Product.destroy_all
State.destroy_all
City.destroy_all

puts "Old records destroyed"

MULTIPLIER = 10

STATES = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

def generate_category
  c = Category.new
  c[:name] = Faker::Commerce.department(1)
  c[:description] = Faker::Lorem.sentence
  c.save
end

# More controllable price
def rand_price
  (rand * 10000).floor/100.0
end

def generate_products
  p = Product.new
  p[:name] = Faker::Commerce.product_name
  p[:description] = Faker::Lorem.sentence
  p[:sku] = Faker::Code.ean
  p[:price] = rand_price
  p[:category_id] = Category.pluck(:id).sample
  p.save
end

def generate_state(state)
  State.create(:state => state)
end

def generate_city
  City.create(:city => Faker::Address.city)
end

def generate_address(user)
  a = Address.new
  a[:state_id] = State.pluck(:id).sample
  a[:city_id]  = City.pluck(:id).sample
  a[:street_address] = Faker::Address.street_address
  a[:secondary_address] = Faker::Address.secondary_address
  a[:zip_code] = Faker::Address.zip
  a[:user_id] = user.id
  a.save
end

def today_date
  Time.now.to_date
end

def user_date_range
  (today_date - 365)..today_date
end

def generate_address_for_user(user)
  rand(6).times { generate_address(user) }
end

def generate_user
  u = User.new
  u[:first_name] = Faker::Name.first_name
  u[:last_name] = Faker::Name.last_name
  u[:created_at] = rand(user_date_range)
  u[:email] = Faker::Internet.email

  generate_address_for_user(u)
  u[:shipping_id] = Address.where("user_id = ?", u.id).sample[:id]
  u[:billing_id] = Address.where("user_id = ?", u.id).sample[:id]
  u.save
end

def generate_order_contents(order)
  product_ids = Product.pluck(:id).shuffle
  rand(1..10).times do
    oc = OrderContent.new
    oc[:order_id] = order.id
    oc[:product_id] = product_ids.pop
    oc[:quantity] = rand(1..10)
  end
  oc.save
end

def generate_credit_card
  c = CreditCard.new
  c[:type] = Faker::Business.credit_card_type
  c[:card_number] = Faker::Business.credit_card_number
  c[:exp_year] = today_date.year + 1 + rand(5)
  c[:exp_month] = rand(1..12)
  c[:ccv] = Faker::Number.number(3)
  c[:user_id] = User.pluck(:id).sample
  c.save
end

def has_credit_cards?(user)
  user.credit_cards.any?
end

def generate_order(user)
  o = Order.new
  o[:user_id] = user.id
  o[:credit_card_id] = user.credit_cards.sample[:id]
  o[:shipping_id] = Address.where("user_id = ?", user.id).sample[:id]
  o[:billing_id] = Address.where("user_id = ?", user.id).sample[:id]
  o[:checkout_date] = rand(user.created_at..today_date)

  generate_order_contents(o)
  o.save
end

puts "generating categories..."
MULTIPLIER.times { generate_category }
puts "categories created"

puts "generating products..."
(MULTIPLIER * 20).times { generate_products }
puts "products created"

puts "generating states..."
STATES.each { |state| generate_state(state) }
puts "states created"

puts "generating cities..."
100.times { generate_city }
puts "cities created"

puts "generating users with addresses..."
(MULTIPLIER * 20).times { generate_user }
puts "Users with addresses created"

puts "generating credit_cards info..."
(MULTIPLIER * 20).times { generate_credit_card }
puts "credit_cards created"

puts "generating orders for users with credit cards..."
User.all.each do |user|
  if user.credit_cards.any?
    rand(1..10).times { generate_order(user) }
  end
end
puts "orders created"
puts "Seeds done!"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


MULTIPLIER = 4

puts "Deleting the Data..."

User.delete_all
State.delete_all
ShoppingCart.delete_all
Product.delete_all
CreditCard.delete_all
Country.delete_all
City.delete_all
Category.delete_all
Address.delete_all
Billing.delete_all
Order.delete_all

puts "Data Deleted"


puts "Creating the Data..."

def create_user(start_date, end_date)
  User.create(email: Faker::Internet.email, 
                        first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                        created_at: Faker::Time.between(start_date, end_date) )
end

def create_address(user)
  Address.create( user_id: user.id,
                  street_nb: Faker::Address.building_number,
                  street: Faker::Address.street_name,
                  city_id: rand(1..100),
                  state_id: rand(1..10),
                  zip_code: Faker::Address.zip_code,
                  country_id: rand(0..5) )
end


def create_credit_card(user)
  CreditCard.create( user_id: user.id,
                     number: Faker::Business.credit_card_number,
                     type: Faker::Business.credit_card_type,
                     exp: Faker::Business.credit_card_expiry_date,
                     security: rand(100..999) )
end

def create_product
  Product.create( title: Faker::Commerce.product_name,
                  description: Faker::Lorem.sentence,
                  price: Faker::Commerce.price,
                  sku: rand(10000000..90000000),
                  category_id: rand(1..4),
                  created_at: Faker::Date.between(2.years.ago, 1.year.ago))
end

def create_order(user)
  Order.create( user_id: user.id,
                created_at: Faker::Date.between(1.year.ago, Date.today) )
end

def create_shopping_cart(order)
  ShoppingCart.create( order_id: order.id,
                       product_id: rand(1..20),
                       quantity: rand(1..10),
                       created_at: Faker::Date.between(1.year.ago, Date.today) )
end


def create_billing(user, order)
  Billing.create( user_id: user.id,
                  address_id: Address.where("user_id = #{user.id}"),
                  credit_card_id: CreditCard.where("user_id = #{user.id}"),
                  created_at: order.check_out )
end

# Cities
puts "Creating cities"

30.times {City.create(name: Faker::Address.city)}

# States
puts "Creating states"

10.times {State.create(name: Faker::Address.state)}

# Countries
puts "Creating countries"

5.times {Country.create(name: Faker::Address.country)}

# Categories
puts "Creating categories"

5.times {Category.create(description: Faker::Commerce.department)}

# Create Users
puts "Adding Users"

10.times do
  create_user(Time.now, 12.months.ago)
end

(1..5).each do |i|
  i*1.times { create_user(8.months.ago, 12.months.ago) }
  i*2.times { create_user(4.months.ago, 8.months.ago) }  
  i*3.times { create_user(Time.now, 4.months.ago) }
end

# Create Products
puts "Adding Products"

20.times do
  create_product
end

# Create Orders And Shopping Cart
puts "Adding some orders And shopping Cart Items"


(MULTIPLIER * 10).downto(1) do |i|

  # Simulate the growth of orders over time
  time_range = MULTIPLIER * 10
  start_time = Time.now

  if i > time_range - time_range/4
     end_time = 12.months.ago
  elsif i > time_range/2
    end_time = 8.months.ago
  else
    end_time = 4.months.ago
  end


  user = User.all.sample
  order = create_order(user)
  rand(1..3).times do
    create_shopping_cart(order)
  end

  unless rand(0..1) == 0
    order.update(check_out: Faker::Date.between(end_time, start_time))
    rand(1..3).times do
      create_address(user)
    end

    billing = create_billing(user, order)
    order.update(billing_id: billing.id)
  end

end

puts "And we're all set!"






























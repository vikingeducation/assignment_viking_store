# seeds.rb

# NEEDS IMPROVING

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Blow away current data
User.destroy_all
Address.destroy_all
Product.destroy_all
Category.destroy_all
Order.destroy_all
OrderItem.destroy_all

puts "Existing data deleted"

puts "\nNow seeding ..." 

# multiplier. 1 initially to test small amounts of data. 5 and 20 later to test on large scale. To be set manually before re-seeding data.
MULTIPLIER = 1

# create sample data arrays

# 100 cities

CITIES = []
100.times do
  CITIES << city: Faker::Address.city
end

# Most cities are not associted with addresses
CITIES_WITH_ADDRESSES = CITIES[1..20]

# We need from 5 states and upwards according to multiplier (max 50)
STATES = []
(MULTIPLIER/2)*5.times do
  CITIES << city: Faker::Address.city
end

# We need 10 categories


MULTIPLIER * 25.times do

  fname = Faker::Name.first_name
  lname = Faker::Name.last_name

  u = User.create(first_name: fname, last_name: lname, email: Faker::Internet.free_email(fname+'.'+lname), phone: Faker::PhoneNumber.phone_number)

  # create 1 - 5 address per user
  address_count = (rand(5) + 1)
  # determine default shipping and billing ids
  shipping_default_id = (address_count.sample) + 1 # this will be its id
  billing_default_id = (address_count.sample + 1) # this will be its id
  u = User.create(shipping_default_id: shipping_default_id, billing_default_id: billing_default_id)

  # create addresses for this user
  address_count.times do
    Address.create(street: Faker::Address.street_address, city: CITIES_WITH_ADDRESSES.sample, state: STATES.sample, zip: Faker::Address.zip, user_id: u.id)   
  end

end



CATEGORIES = ["spear", "axe", "bow", "arrow", "knife", "sax", "sword", "shield", "mailcoat", "helmet"]

# We need 30 products. Create from concatenation of category + "long/medium/short" (10 * 3 = 30)

PRODUCT_NAMES = []
CATEGORIES.each do |cat|
  PRODUCT_NAMES << cat + "-small"
  PRODUCT_NAMES << cat + "-medium"
  PRODUCT_NAMES << cat + "-large"
end

  Product.create(title: PRODUCT_NAMES.sample, description: Faker::Superhero.descriptor, price: Faker::Commerce.price, sku: Faker::Code.isbn)

  Category.create(name: Faker::Cat.registry, description: Faker::Cat.breed)


# 100 historical orders
MULTIPLIER * 100.times do

  Order.create(date_completed: Faker::Date.between(1.year.ago, Date.today), order_value: Faker::Number.between(20.00, 100.00), tax_rate: 6)

  OrderItem.create(quantity: Faker::Number.number(2))

puts "Seeds Done!"
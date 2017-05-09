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





MULTIPLIER * 25.times do

  fname = Faker::Name.first_name
  lname = Faker::Name.last_name

  u = User.create(first_name: fname, last_name: lname, email: Faker::Internet.free_email(fname+'.'+lname), phone: Faker::PhoneNumber.phone_number)

  # create 1 - 5 address per user
  address_count = (rand(5) + 1)
  address_count.times do
    Address.create(street: Faker::Address.street_address, city: CITIES_WITH_ADDRESSES.sample, state: Faker::Address.state, zip: Faker::Address.zip, user_id: u.id)   
  end
  # determine default addresses
  default_shipping = address_count.sample + 1 # this will be its id
  default_billing = address_count.sample + 1 # this will be its id
        # No! The address id's will increment beyond 5 as more are created ... think again

  if default_shipping == default_billing
    Address.where(id = default_shipping).create(default: "both")
  else
    Address.where(id = default_shipping).create(default: "shipping")
    Address.where(id = default_billing).create(default: "billing")
  end

end

  Product.create(title: Faker::Superhero.name, description: Faker::Superhero.descriptor, price: Faker::Commerce.price, sku: Faker::Code.isbn)

  Category.create(name: Faker::Cat.registry, description: Faker::Cat.breed)


# 100 historical orders
MULTIPLIER * 100.times do

  Order.create(date_completed: Faker::Date.between(1.year.ago, Date.today), order_value: Faker::Number.between(20.00, 100.00), tax_rate: 6)

  OrderItem.create(quantity: Faker::Number.number(2))

puts "Seeds Done!"
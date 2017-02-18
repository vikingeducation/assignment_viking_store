# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# products
# categories
# orders
# items

User.destroy_all
State.destroy_all
City.destroy_all
Category.destroy_all
Product.destroy_all

num_cities = 1000;
num_users = 100;
num_categories = 10;

# create states
STATES =     
  ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 
  'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 
  'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']
STATES.each do |state|
  State.create(abbr: state)
end

# create cities
num_cities.times do
  City.create(name: Faker::Address.city)
end

# create categories and products
num_categories.times do
  category = Category.create(name: Faker::Commerce.department, description: Faker::Lorem.paragraph)
  rand(15..30).times do 
    category.products.create(title: Faker::Commerce.product_name, description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price, SKU: Faker::Lorem.word )
  end
end

# create users, addresses, credit cards
num_users.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email("#{first_name} #{last_name}")
  phone_number = Faker::PhoneNumber.phone_number
  user = User.create(first_name: first_name, last_name: last_name, email: email, phone_number: phone_number)
  rand(1..5).times do 
    street_line_1 = Faker::Address.street_address
    city_id = City.pluck(:id).sample
    state_id = City.pluck(:id).sample
    zip = Faker::Address.zip_code
    user.addresses.create(street_line_1: street_line_1, city_id: city_id, state_id: state_id, zip: zip)
    number = Faker::Business.credit_card_number
    cvv = Faker::Number.number(3).to_s
    month_exp = rand(1..12)
    year_exp = rand(2017..2025)
    user.credit_cards.create(number: number, cvv: cvv, month_exp: month_exp, year_exp: year_exp)
  end
  user.update_attributes!(
    shipping_id: user.addresses.pluck(:id).sample,
    billing_id: user.addresses.pluck(:id).sample, 
    credit_card_id: user.credit_cards.pluck(:id).sample )
end
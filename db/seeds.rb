# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clear all existing tables
def clear_seeds
  Address.destroy_all
  CreditCard.destroy_all
  OrderProduct.destroy_all
  Order.destroy_all
  ProductCategory.destroy_all
  ProductDetail.destroy_all
  Product.destroy_all
  Shipment.destroy_all
  User.destroy_all
end

clear_seeds


# Create 100 users.
# This fails but continues looping if email is not unique,
# which guarantees that I'll end up with the right number
# of users even if Faker randomly tries to make duplicates
while User.count < 100 do

  u = User.new
  u.email = Faker::Internet.email
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.phone = Faker::PhoneNumber.phone_number

  u.save

end


# Create 100 city options (not affected by seed mult)
city_options = Array.new(100){ Faker::Address.city }.uniq!
while city_options.size < 100 do
  city_options << Faker::Address.city
  city_options.uniq!
end

# Create 5-10 state options (not affected by seed mult)
state_options = Array.new(8){ Faker::Address.state_abbr }.uniq!
while state_options.size < 8 do
  state_options << Faker::Address.state_abbr
  state_options.uniq!
end


# Generate 0 to 5 addresses for each user, picking one for default billing & one for default shipping; randomize ZIP codes




# Create 6 categories

# Create 2-5 products per category


# Create 100 orders (plus shipments) for the past year, growing over time


# Create 25 active carts (not yet shipped)


# build in seed multiplier

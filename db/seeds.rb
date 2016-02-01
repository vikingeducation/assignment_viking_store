# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

MULTIPLIER = 30

# create users
MULTIPLIER.times do
  first_name = Faker::Name.first_name
    User.create(
      first_name: first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email(first_name),
      phone_number: Faker::PhoneNumber.phone_number
    )
end

cities = []
states = []
MULTIPLIER.times do
  cities << Faker::Address.city
  states << Faker::Address.state
end

# create addresses
User.all.each do |user|
  3.times do
    user.addresses.create(
      line_1: Faker::Address.street_address,
      city: cities.sample,
      region: states.sample,
      country: "United States",
      zip_code: Faker::Address.zip_code
    )
  end
  user.shipping_address = user.addresses.sample
  user.billing_address = user.addresses.sample
end

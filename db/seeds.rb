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




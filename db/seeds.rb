# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MULTIPLIER = 10
city_name = Array.new(100){Faker::Address.city}
state_name = Array.new(10){Faker::Address.state}

def create_users(start_date, end_date)
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name  , email: Faker::Internet.email, created_at: Faker::Date.between(start_date, end_date))
end

Rake::Task['db:reset'].invoke

#staggers more users towards now
(MULTIPLIER*2).times do |i|
  create_users(3.years.ago, 2.years.ago)
  2.times {create_users(2.years.ago, 1.years.ago)}
  3.times {create_users(1.years.ago, Time.now)}
end



#10-30 products
#~6 categories

#100 orders in past year (growth rate)

#25 shopping carts
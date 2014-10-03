# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#generate products


#generate users, need 100 users


#generate addresses, 155 cities, clumped
def sample_city
  {"city" => Faker::Address.city, "state" => Faker::Address.state, "zip" => (Faker::Address.zip_code).to_i}
end

cities, towns, villages = [], [], []

5.times do
  cities << sample_city
  5.times do
    towns << sample_city
    5.times do
      villages << sample_city
    end
  end
end

sample_cities = [cities, towns, villages]

def generate_addresses(user_id)
  (rand(6)).times do
    city_instance = sample_cities.sample.sample
    Address.new({user_id: user_id, street_address: Faker::Address.street_address, city: city_instance["city"], state: city_instance["state"], zip: Faker::Address.zip_code.to_i}).save
  end
end

#generate orders

#generate order contents

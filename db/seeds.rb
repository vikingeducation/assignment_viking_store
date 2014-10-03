# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

scalar = 5

#generate products
6*scalar.times do
end

#generate users, 100 users
20*scalar.times do
  sample_name = Faker::Name.name
  u = User.new({name: sample_name, email: Faker::Internet.email(sample_name), phone_number: Faker::PhoneNumber.phone_number})
  u.save
end

#generate addresses, scalar+scalar^2+scalar^3 cities
def sample_city
  {"city" => Faker::Address.city, "state" => Faker::Address.state, "zip" => (Faker::Address.zip_code).to_i}
end

def sample_cities
  cities, towns, villages = [], [], []
  scalar.times do
    cities << sample_city
    scalar.times do
      towns << sample_city
      scalar.times do
        villages << sample_city
      end
    end
  end
  [cities, towns, villages]
end

def generate_addresses(user_id)
  (rand(6)).times do
    city_instance = sample_cities.sample.sample
    a = Address.new({user_id: user_id, street_address: Faker::Address.street_address, city: city_instance["city"], state: city_instance["state"], zip: Faker::Address.zip_code.to_i})
    a.save
  end
end

#generate orders

#generate order contents

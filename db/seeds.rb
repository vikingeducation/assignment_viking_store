# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SCALAR = 5

#generate products
sample_categories = []

SCALAR.times do
  sample_categories << Faker::Commerce.department
end

(SCALAR**2).times do
  p = Product.new({title: Faker::Commerce.product_name, category: sample_categories.sample, description: Faker::Lorem.sentence, sku: rand(SCALAR**4)+1, price: Faker::Commerce.price})
  p.save
end

#generate addresses, SCALAR+SCALAR^2+SCALAR^3 cities (155)
def sample_city
  {"city" => Faker::Address.city, "state" => Faker::Address.state, "zip" => (Faker::Address.zip_code).to_i}
end

def sample_cities
  cities, towns, villages = [], [], []
  SCALAR.times do
    cities << sample_city
    SCALAR.times do
      towns << sample_city
      SCALAR.times do
        villages << sample_city
      end
    end
  end
  [cities, towns, villages]
end

SAMPLECITIES = sample_cities

def random_user_addresses(user_id)
  address_choices = (Address.select(:id).where(:user_id => user_id)).to_a
  address_choices[0] ? [address_choices.sample[:id], address_choices.sample[:id]] : [nil, nil]
end

def generate_addresses(user_id)
  (rand(6)).times do
    city_instance = SAMPLECITIES.sample.sample
    a = Address.new({user_id: user_id, street_address: Faker::Address.street_address, city: city_instance["city"], state: city_instance["state"], zip: Faker::Address.zip_code.to_i})
    a.save
  end
  random_user_addresses(user_id)
end

#generate users, 20*SCALAR users (100)
def creation_date

end

(20*SCALAR).times do |x|
  sample_name = Faker::Name.name
  address_samples = generate_addresses(x+1)

  u = User.new({id: x+1, name: sample_name, email: Faker::Internet.email(sample_name), phone_number: Faker::PhoneNumber.phone_number, default_billing_address: address_samples[0], default_shipping_address: address_samples[1]})

  u.save
end

#generate orders
def completion(user)
  user[:default_billing_address] && rand(5) > 0
end

def placement_date
  rand([Time.now - 12.month, Time.now - 8.month, Time.now - 4.month].sample..Time.now)
end

(SCALAR*25).times do
  sample_user = User.find(rand(User.count)+1)
  random_addresses = random_user_addresses(sample_user.id)
  completed_order = completion(sample_user)
  o = Order.new({user_id: sample_user.id, shipping_address: random_addresses[0], billing_address: random_addresses[1], placed: completed_order, when_placed: placement_date})
  o.save
end

#generate order contents

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SCALAR = 5 # Seed multiplier

#generate products
sample_categories = []

SCALAR.times do
  sample_categories << Faker::Commerce.department
end

(SCALAR**2).times do
  p = Product.new()
  p[:title]       = Faker::Commerce.product_name
  p[:category]    = sample_categories.sample
  p[:description] = Faker::Lorem.sentence
  p[:sku]         = rand(SCALAR**4)+1
  p[:price]       = Faker::Commerce.price
  p.save
end

#generate addresses, SCALAR+SCALAR^2+SCALAR^3 cities (155)
def sample_city # generates a new city/state/zip combination
  {"city" => Faker::Address.city, "state" => Faker::Address.state, "zip" => (Faker::Address.zip_code).to_i}
end

def sample_cities # appends city/state/zip combinations to three echelons in an array, with more instances for each successive echelon
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

SAMPLECITIES = sample_cities # so that the method is only run once

def random_user_address(user_id)
  address_choices = (Address.select(:id).where(:user_id => user_id)).to_a
  address_choices[0] ? address_choices.sample[:id] : nil
end

def city_sampling
  SAMPLECITIES.sample.sample
end

def generate_addresses(user_id)
  (rand(6)).times do
    city_instance = city_sampling
    a = Address.new()
    a[:user_id]        = user_id
    a[:street_address] = Faker::Address.street_address
    a[:city]           = city_instance["city"]
    a[:state]          = city_instance["state"]
    a[:zip]            = Faker::Address.zip_code.to_i
    a.save
  end
end

#generate users, 20*SCALAR users (100)
def creation_date
  time_frames = []
  SCALAR.times do |x|
    time_frames << Time.now - ((x+1)*3).month
  end
  date_range = (time_frames.sample..Time.now)
  rand(date_range)
end

(20*SCALAR).times do |x|
  sample_name = Faker::Name.name
  generate_addresses(x+1)

  u = User.new()
  u[:id]                       = x+1
  u[:name]                     = sample_name
  u[:email]                    = Faker::Internet.email(sample_name)
  u[:phone_number]             = Faker::PhoneNumber.phone_number
  u[:default_billing_address]  = random_user_address(x+1)
  u[:default_shipping_address] = random_user_address(x+1)
  u[:created_at]               = creation_date

  u.save
end

#generate order contents
def generate_contents(order_id)
  (rand(SCALAR)+1).times do
    c = OrderContent.new()
    c[:order_id]   = order_id
    c[:product_id] = rand(Product.count)+1
    c[:quantity]   = rand(SCALAR)+1
    c.save
  end
end

#generate orders
def completion(user)
  user[:default_billing_address] && rand(5) > 0 # must prevent multiple carts Order.find(user[:id]).where("completed = false")
end

def placement_date(user)
  rand(user[:created_at]..Time.now)
end

(SCALAR*25).times do
  sample_user = User.find(rand(User.count)+1)
  completed_order = completion(sample_user)
  o = Order.new()
  o[:user_id]          = sample_user.id
  o[:shipping_address] = random_user_address(sample_user.id)
  o[:billing_address]  = random_user_address(sample_user.id)
  o[:placed]           = completed_order
  o[:when_placed]      = completed_order ? placement_date(sample_user) : nil
  o.save
  generate_contents(o[:id])
end

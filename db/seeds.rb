# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# --------------------------------
# Set the multiplier for scaling data size
# --------------------------------
MULTIPLIER = 1

# -----------------------------------------

puts "Tearing down and rebuilding database"

# --------------------------------
# Tear down the existing database
# --------------------------------
Rake::Task['db:migrate:reset'].invoke

puts "Configuring and initializing"

# --------------------------------
# Table specific constants
# --------------------------------
MAX_ITEMS_PER_ORDER = 10 * MULTIPLIER

NUM_USERS = 100 * MULTIPLIER
NUM_USERS_WITH_ADDRESSES = (NUM_USERS * 0.75).to_i

NUM_CITIES = 100 * MULTIPLIER

NUM_PRODUCTS = 30 * MULTIPLIER
NUM_PRODUCT_CATEGORIES = 6 * MULTIPLIER

NUM_SHOPPING_CARTS = 25 * MULTIPLIER

NUM_HISTORICAL_ORDERS = 100 * MULTIPLIER
NUM_DELIVERED_ORDERS = (NUM_HISTORICAL_ORDERS * 0.75)
NUM_UNDELIVERED_ORDERS = NUM_HISTORICAL_ORDERS - NUM_DELIVERED_ORDERS
NUM_ORDERS = NUM_SHOPPING_CARTS + NUM_HISTORICAL_ORDERS

NUM_SHIPMENTS = NUM_HISTORICAL_ORDERS / 10
NUM_SHIPMENTS_DELIVERED = (NUM_SHIPMENTS * 0.75).to_i

CREDIT_CARD_COMPANIES = [
  "mastercard",
  "discover",
  "americanexpress",
  "visa"
]

STATES = {
  :AL => 'Alabama',
  :MT => 'Montana',
  :AK => 'Alaska',
  :NE => 'Nebraska',
  :AZ => 'Arizona',
  :NV => 'Nevada',
  :AR => 'Arkansas',
  :NH => 'New Hampshire',
  :CA => 'California',
  :NJ => 'New Jersey',
  :CO => 'Colorado',
  :NM => 'New Mexico',
  :CT => 'Connecticut',
  :NY => 'New York',
  :DE => 'Delaware',
  :NC => 'North Carolina',
  :FL => 'Florida',
  :ND => 'North Dakota',
  :GA => 'Georgia',
  :OH => 'Ohio',
  :HI => 'Hawaii',
  :OK => 'Oklahoma',
  :ID => 'Idaho',
  :OR => 'Oregon',
  :IL => 'Illinois',
  :PA => 'Pennsylvania',
  :IN => 'Indiana',
  :RI => 'Rhode Island',
  :IA => 'Iowa',
  :SC => 'South Carolina',
  :KS => 'Kansas',
  :SD => 'South Dakota',
  :KY => 'Kentucky',
  :TN => 'Tennessee',
  :LA => 'Louisiana',
  :TX => 'Texas',
  :ME => 'Maine',
  :UT => 'Utah',
  :MD => 'Maryland',
  :VT => 'Vermont',
  :MA => 'Massachusetts',
  :VA => 'Virginia',
  :MI => 'Michigan',
  :WA => 'Washington',
  :MN => 'Minnesota',
  :WV => 'West Virginia',
  :MS => 'Mississippi',
  :WI => 'Wisconsin',
  :MO => 'Missouri',
  :WY => 'Wyoming'
}

# --------------------------------
# Containers
# --------------------------------
full_user_names = []
addresses = []

# --------------------------------
# Helper functions
# --------------------------------
def date_from(i, max)
  (365 - (365 * Math.sqrt(i.to_f / max.to_f))).days.ago
end

def to_sku(name, id)
  a = name.split(' ').reverse
  s = a[0].downcase
  s += "-#{a[1].downcase}-#{id}"
end 

puts "Creating users"
# --------------------------------
# Users
# --------------------------------
# email: Faker::Internet.free_email('King Arthur')
# username: Faker::Internet.user_name('George Castanza', %w(_ -))
NUM_USERS.times do |i|
  print "#{i + 1} of #{NUM_USERS}\r"

  name = [Faker::Name.first_name, Faker::Name.last_name]
  full_user_names << name
  str = name.join(' ')
  User.create(
    :email => Faker::Internet.free_email(str),
    :username => Faker::Internet.user_name(str, %w(_ -)),
    :created_at => date_from(i, NUM_USERS),
    :updated_at => date_from(i, NUM_USERS)
  )
end

puts "Creating credit card companies"
# --------------------------------
# CreditCardCompanies
# --------------------------------
# name: Faker::Business.credit_card_type
CREDIT_CARD_COMPANIES.each_with_index do |company, i|
  print "#{i + 1} of #{CREDIT_CARD_COMPANIES.length}\r"

  CreditCardCompany.create(
    :name => company,
    :created_at => 1.year.ago,
    :updated_at => 1.year.ago
  )
end

puts "Creating countries"
# --------------------------------
# Country
# --------------------------------
# name: countries value
# abbreviation: countries key
Country.create(
  :name => 'United States',
  :abbreviation => 'USA',
  :created_at => 1.year.ago,
  :updated_at => 1.year.ago
)
COUNTRY_ID = Country.where("abbreviation = 'USA'").limit(1).first.id

puts "Creating states"
# --------------------------------
# States
# --------------------------------
# name: states value
# abbreviation: states key
# country_id
i = 0
STATES.each do |key, value|
  print "#{i + 1} of #{STATES.length}\r"
  i += 1

  name = value
  abbreviation = key.to_s
  State.create(
    :name => name,
    :abbreviation => abbreviation,
    :country_id => COUNTRY_ID,
    :created_at => 1.year.ago,
    :updated_at => 1.year.ago
  )
end

puts "Creating cities and zip codes"
# --------------------------------
# Cities
# --------------------------------
# name: Faker::Address.city
# state_id: random id from states

# --------------------------------
# ZipCodes
# --------------------------------
# code: Faker::Address.zip_code
# state_id: random id from states
NUM_CITIES.times do |i|
  print "#{i + 1} of #{NUM_CITIES}\r"

  state_id = i % STATES.length
  state_id = STATES.length if state_id == 0
  City.create(
    :name => Faker::Address.city,
    :state_id => state_id,
    :created_at => 1.year.ago,
    :updated_at => 1.year.ago
  )

  ZipCode.create(
    :code => Faker::Address.zip_code,
    :state_id => state_id,
    :created_at => 1.year.ago,
    :updated_at => 1.year.ago
  )
end

puts "Creating product categories"
# --------------------------------
# ProductCategories
# --------------------------------
# name: Faker::Commerce.department(1, true)
# description: Faker::Lorem.sentence(10)
NUM_PRODUCT_CATEGORIES.times do |i|
  print "#{i + 1} of #{NUM_PRODUCT_CATEGORIES}\r"

  ProductCategory.create(
    :name => Faker::Commerce.department(3, true),
    :description => Faker::Lorem.sentence(10),
    :created_at => 1.year.ago,
    :updated_at => 1.year.ago
  )
end

puts "Creating products"
# --------------------------------
# Products
# --------------------------------
# name: Faker::Commerce.product_name
# description: Faker::Lorem.sentence(10)
# units: rand(0..100)
# sku: to_sku
# price: Faker::Commerce.price
# product_category_id
NUM_PRODUCTS.times do |i|
  print "#{i + 1} of #{NUM_PRODUCTS}\r"

  name = Faker::Commerce.product_name
  product_category_id = i % NUM_PRODUCT_CATEGORIES
  product_category_id = NUM_PRODUCT_CATEGORIES if product_category_id == 0
  Product.create(
    :name => name,
    :description => Faker::Lorem.sentence(10),
    :units => rand(0..100),
    :sku => to_sku(name, i + 1),
    :price => Faker::Commerce.price,
    :product_category_id => product_category_id,
    :created_at => 1.year.ago,
    :updated_at => date_from(i, NUM_PRODUCTS)
  )
end

puts "Creating shipments"
# --------------------------------
# Shipments
# --------------------------------
# departure_time: random datetime between 1 year ago and now
# arrival_time: random datetime between departure_time and 2 weeks later
# destination_id
NUM_SHIPMENTS.times do |i|
  print "#{i + 1} of #{NUM_SHIPMENTS}\r"

  departure_time = date_from(i, NUM_SHIPMENTS)
  arrival_time = departure_time + 14.days if i < NUM_SHIPMENTS_DELIVERED
  timestamp = departure_time - 1.days
  city = City.find(rand(1..City.count))
  zip_code_id = ZipCode.where("state_id = #{city.state_id}").shuffle.first.id
  addresses << {
    :street => Faker::Address.street_address,
    :post_office_box => Faker::Number.number(3),
    :city_id => city.id,
    :state_id => city.state_id,
    :zip_code_id => zip_code_id,
    :country_id => COUNTRY_ID,
    :shipment_id => i + 1,
    :created_at => timestamp,
    :updated_at => timestamp
  }
  destination_id = addresses.length
  Shipment.create(
    :departure_time => departure_time,
    :arrival_time => arrival_time,
    :destination_id => destination_id,
    :created_at => timestamp,
    :updated_at => timestamp
  )
end

puts "Creating profiles, user addresses, and credit cards"
# --------------------------------
# Profiles
# --------------------------------
# first_name: Faker::Name.first_name
# last_name: Faker::Name.last_name
# phone_number: Faker::PhoneNumber.cell_phone
# credit_card_id
# billing_address_id
# shipping_address_id
# user_id

# --------------------------------
# CreditCards
# --------------------------------
# number: Faker::Business.credit_card_number
# expiration_date: Faker::Business.credit_card_expiry_date
# company_id: Faker::Business.credit_card_type
users = User.all
users.each_with_index do |user, i|
  print "#{i + 1} of #{users.length}\r"

  if i < NUM_USERS_WITH_ADDRESSES
    city = City.find(rand(1..City.count))
    zip_code_id = ZipCode.where("state_id = #{city.state_id}").shuffle.first.id
    billing_address = {
      :street => Faker::Address.street_address,
      :post_office_box => Faker::Number.number(3),
      :city_id => city.id,
      :state_id => city.state_id,
      :zip_code_id => zip_code_id,
      :country_id => COUNTRY_ID,
      :profile_id => user.id,
      :created_at => user.created_at,
      :updated_at => user.updated_at
    }
    shipping_address = {
      :street => i % 4 == 0 ? Faker::Address.street_address : billing_address[:street],
      :post_office_box => i % 4 == 0 ? billing_address[:post_office_box] : Faker::Number.number(3),
      :city_id => city.id,
      :state_id => city.state_id,
      :zip_code_id => zip_code_id,
      :country_id => COUNTRY_ID,
      :profile_id => user.id,
      :created_at => user.created_at,
      :updated_at => user.updated_at
    }
    addresses << billing_address
    billing_address_id = addresses.length
    addresses << shipping_address
    shipping_address_id = addresses.length
    (i % 5).times do
      addresses << {
        :street => Faker::Address.street_address,
        :post_office_box => Faker::Number.number(3),
        :city_id => city.id,
        :state_id => city.state_id,
        :zip_code_id => zip_code_id,
        :country_id => COUNTRY_ID,
        :profile_id => user.id,
        :created_at => user.created_at,
        :updated_at => user.updated_at
      }
    end
  end
  Profile.create(
    :first_name => full_user_names[user.id - 1][0],
    :last_name => full_user_names[user.id - 1][1],
    :phone_number => Faker::PhoneNumber.cell_phone,
    :credit_card_id => user.id,
    :billing_address_id => billing_address_id,
    :shipping_address_id => shipping_address_id,
    :user_id => user.id,
    :created_at => user.created_at,
    :updated_at => user.updated_at
  )
  CreditCard.create(
    :number => Faker::Business.credit_card_number,
    :expiration_date => Faker::Business.credit_card_expiry_date,
    :profile_id => user.id,
    :company_id => rand(0..CREDIT_CARD_COMPANIES.length - 1),
    :created_at => user.created_at,
    :updated_at => user.updated_at
  )
end

puts "Creating orders"
# --------------------------------
# Orders
# --------------------------------
# is_paid
# user_id: random user_id
# shipment_id: null or shipment_id
delivered_shipments = Shipment.where('arrival_time IS NOT NULL')
undelivered_shipments = Shipment.where('arrival_time IS NULL')
NUM_ORDERS.times do |i|
  print "#{i + 1} of #{NUM_ORDERS}\r"

  if i < NUM_HISTORICAL_ORDERS
    is_paid = true
    if i < NUM_DELIVERED_ORDERS
      shipments = delivered_shipments
    else
      shipments = undelivered_shipments
    end
    index = i % shipments.length
    shipment = shipments[index]
    shipment_id = shipment.id
    created_at = shipment.created_at - 7.days
    updated_at = shipment.created_at - 7.days
  end
  user = users.shuffle.first
  Order.create(
    :is_paid => is_paid,
    :user_id => user.id,
    :shipment_id => shipment_id,
    :created_at => created_at,
    :updated_at => updated_at
  )
end

puts "Creating order items"
# --------------------------------
# OrderItems
# --------------------------------
# order_id
# product_id
orders = Order.all
products = Product.all
orders.each_with_index do |order, i|
  print "#{i + 1} of #{orders.length}\r"

  rand(1..MAX_ITEMS_PER_ORDER).times do |j|
    OrderItem.create(
      :order_id => order.id,
      :product_id => products.shuffle.first.id,
      :created_at => order.created_at,
      :updated_at => order.updated_at
    )
  end
end

puts "Creating addresses and residences"
# --------------------------------
# Addresses
# --------------------------------
# street: Faker::Address.street_address
# post_office_box: Faker::Number.number(3)
# city_id
# state_id
# zip_code_id
# country_id
i = 0
addresses.each do |address|
  print "#{i + 1} of #{addresses.length}\r"
  i += 1

  a = Address.create(
    :street => address[:street],
    :post_office_box => address[:post_office_box],
    :city_id => address[:city_id],
    :state_id => address[:state_id],
    :zip_code_id => address[:zip_code_id],
    :country_id => address[:country_id],
    :shipment_id => address[:shipment_id],
    :profile_id => address[:profile_id],
    :created_at => address[:created_at],
    :updated_at => address[:updated_at]
  )
end

puts "\nDone!"




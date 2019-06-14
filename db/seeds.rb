require 'benchmark'

SEED_MULTIPLIER = 1

STATES_AMOUNT = 10
CITIES_AMOUNT = 100 * SEED_MULTIPLIER

USERS_AMOUNT = 100 * SEED_MULTIPLIER
CATEGORIES_AMOUNT = 7 * SEED_MULTIPLIER
PRODUCTS_AMOUNT = 20 * SEED_MULTIPLIER
HISTORICAL_ORDERS_AMOUNT = 100 * SEED_MULTIPLIER
ACTIVE_SHOPPING_CARTS = 25 * SEED_MULTIPLIER
DAYS_IN_YEAR = 365
MAX_QUANTITY = 200 * SEED_MULTIPLIER
MIN_QUANTITY = 40 * SEED_MULTIPLIER
MAX_PRODUCTS_PER_CATEGORY = 18 * SEED_MULTIPLIER

def create(task, amount)
  time = Benchmark.realtime do
    amount.times { send("create_#{task.to_s.singularize}") }
  end

  puts "#{amount} #{task} created in #{time} seconds."
end

def random_id(limit)
  rand(1..limit)
end

def create_user
  User.create! do |u|
    u.first_name = Faker::Name.first_name
    u.last_name = Faker::Name.last_name
    u.email = Faker::Internet.free_email
    u.created_at = Faker::Time.backward(DAYS_IN_YEAR)
    u.updated_at = u.created_at
  end
end

def create_state
  State.create!(name: Faker::Address.unique.state)
end

def create_city
  City.create!(name: Faker::Address.unique.city, state_id: random_id(STATES_AMOUNT))
end

def create_category
  Category.create! do |c|
    c.name = Faker::Commerce.unique.department(1)
    c.description = Faker::Hipster.paragraph
  end
end

def create_product
  Product.create! do |p|
    p.title = Faker::Commerce.product_name
    p.price = Faker::Commerce.price
    p.quantity = rand(MIN_QUANTITY..MAX_QUANTITY)
    p.description = Faker::Hipster.paragraph
    p.sku = Faker::Code.ean
    p.category_id = random_id(CATEGORIES_AMOUNT)
  end
end

def create_address(user_id, type)
  Address.create! do |a|
    a.user_id = user_id
    a.address_type = type
    a.street = Faker::Address.street_address
    a.zipcode = Faker::Address.zip
    a.phone_number = Faker::PhoneNumber.phone_number
    a.city_id = random_id(CITIES_AMOUNT)
  end
end

def create_default_shipping_and_billing_address(user_id)
  default_types = [
    [:default_billing, :default_shipping],
    [:default_shipping_and_billing]
  ]

  default_types.sample.each do |type|
    create_address(user_id, type)
  end
end

def create_address_for_user(user_id)
  create_address(user_id, Address::ADDRESS_TYPES.grep(/\A(shipping|billing)/).sample)
end

def add_addresses_to_users
  time = Benchmark.realtime do
    (1..USERS_AMOUNT).each do |user_id|
      create_default_shipping_and_billing_address(user_id)
      rand(0..5).times { create_address_for_user(user_id) }
    end
  end

  puts "#{Address.count} addresses created in #{time} seconds"
end

def create_order(user_id, status, created_at)
  cart = Cart.create! do |c|
    c.user_id = user_id
    c.status = status
    c.created_at = created_at
    c.updated_at = created_at
  end

  rand(1..MAX_PRODUCTS_PER_CATEGORY).times do
    ProductCart.create! do |p|
      p.cart_id = cart.id
      p.product_id = random_id(PRODUCTS_AMOUNT)
      p.created_at = created_at
      p.updated_at = created_at
    end
  end
end

def create_historical_order
  created_at = Faker::Time.backward(DAYS_IN_YEAR)
  create_order(random_id(USERS_AMOUNT), :shipped, created_at)
end

def create_active_shopping_cart
  create_order(random_id(USERS_AMOUNT), :open_order, Time.now)
end

time = Benchmark.realtime do
  DatabaseCleaner.clean_with :truncation
  create :users, USERS_AMOUNT
  create :states, STATES_AMOUNT
  create :cities, CITIES_AMOUNT
  create :categories, CATEGORIES_AMOUNT
  create :products, PRODUCTS_AMOUNT
  add_addresses_to_users
  create :historical_orders, HISTORICAL_ORDERS_AMOUNT
  create :active_shopping_carts, ACTIVE_SHOPPING_CARTS
end

puts "\nIt took #{time} seconds"

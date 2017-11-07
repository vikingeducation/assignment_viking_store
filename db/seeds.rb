require 'benchmark'

SEED_MULTIPLIER = 1
USERS_AMOUNT = 100 * SEED_MULTIPLIER
STATES_AMOUNT = 10
CITIES_AMOUNT = 100 * SEED_MULTIPLIER
CATEGORIES_AMOUNT = 7 * SEED_MULTIPLIER
PRODUCTS_AMOUNT = 20 * SEED_MULTIPLIER
HISTORICAL_ORDERS_AMOUNT = 100 * SEED_MULTIPLIER
ACTIVE_SHOPPING_CARTS = 25 * SEED_MULTIPLIER

def times(amount, task, &block)
  time = Benchmark.realtime do
    amount.times(&block)
  end

  puts "#{amount} #{task} created in #{time} seconds."
end

def create_users
  times(USERS_AMOUNT, 'users') do
    User.create! do |u|
      u.first_name = Faker::Name.first_name
      u.last_name = Faker::Name.last_name
      u.email = Faker::Internet.free_email
      u.created_at = Faker::Time.backward(365)
      u.updated_at = u.created_at
    end
  end
end

def create_states
  times(STATES_AMOUNT, 'states') do
    State.create! do |s|
      s.name = Faker::Address.unique.state
    end
  end
end

def create_cities
  times(CITIES_AMOUNT, 'cities') do
    City.create!(name: Faker::Address.unique.city, state_id: rand(1..STATES_AMOUNT))
  end
end

def create_categories
  times(CATEGORIES_AMOUNT, 'categories') do
    Category.create!(name: Faker::Commerce.unique.department(1))
  end
end

def create_products
  category_ids = (1..CATEGORIES_AMOUNT).to_a
  category_ids = category_ids - category_ids.sample(3)

  times(PRODUCTS_AMOUNT, 'products') do
    Product.create! do |p|
      p.title = Faker::Commerce.product_name
      p.price = Faker::Commerce.price
      p.quantity = rand(40..200)
      p.category_id = category_ids.sample
    end
  end
end

def create_address(user_id, type)
  Address.create! do |a|
    a.user_id = user_id
    a.address_type = type
    a.street = Faker::Address.street_address
    a.zipcode = Faker::Address.zip
    a.phone_number = Faker::PhoneNumber.phone_number
    a.city_id = rand((1..CITIES_AMOUNT))
  end
end

def create_default_shipping_and_billing_address(user_id)
  default_types = [[:default_billing, :default_shipping], [:default_shipping_and_billing]]

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

  rand((1..18)).times do
    ProductCart.create! do |p|
      p.cart_id = cart.id
      p.product_id = rand((1..PRODUCTS_AMOUNT))
      # p.quantity = ''
      p.created_at = created_at
      p.updated_at = created_at
    end
  end
end

def create_historical_orders
  times(HISTORICAL_ORDERS_AMOUNT, 'historical_orders') do
    user_id = rand(1..USERS_AMOUNT)
    created_at = Faker::Time.backward(365)

    create_order(user_id, :shipped, created_at)
  end
end

def create_active_shopping_carts
  times(ACTIVE_SHOPPING_CARTS, 'active_shopping_carts') do
    create_order(rand(1..USERS_AMOUNT), :open_order, Time.now)
  end
end

time = Benchmark.realtime do
  DatabaseCleaner.clean_with :truncation
  create_users
  create_states
  create_cities
  create_categories
  create_products
  add_addresses_to_users
  create_historical_orders
  create_active_shopping_carts
end

puts "\nIt took #{time} seconds"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# wrapper methods to allow us to swap out
# the Faker gem in the future, if required

def random_state
  Faker::Address.state
end

def random_city
  Faker::Address.city
end

########################################

def delete_all_data_in_db
  ShoppingCartProduct.delete_all
  OrderProduct.delete_all
  ShoppingCart.delete_all
  Order.delete_all
  Product.delete_all
  ProductCategory.delete_all

  CreditCard.delete_all
  User.delete_all
  Address.delete_all
  AddressType.delete_all
  City.delete_all
  State.delete_all
  Country.delete_all
end

# test method to generate an instance of each Model
def test
  # delete all data in DB
  delete_all_data_in_db

  # create Country
  country = Country.new(name: "United States of Derp")
  puts "Country created" if country.save

  # create State
  state = State.new(name: "Derp State", country_id: country.id)
  puts "State created" if state.save

  # create City
  city = City.new(name: "Derp City", state_id: state.id)
  puts "City created" if city.save

  # create User
  user = User.new(first_name: "Herp", last_name: "Derp", password: "Herp Derp", email_address: "herp@derp.com")
  puts "User created" if user.save

  # Create Billing and Shipping AddressTypes
  billing_address_type = AddressType.new(address_type: "Billing")
  puts "Billing AddressType created" if billing_address_type.save

  shipping_address_type = AddressType.new(address_type: "Shipping")
  puts "Shipping AddressType created" if shipping_address_type.save

  # create two Addresses for this user
  billing_address = Address.new(street_address: "123 Herp Ave", zipcode: "12345", phone_number: "123-4567", user_id: user.id, address_type_id: billing_address_type.id, city_id: city.id, state_id: state.id, country_id: country.id)
  puts "Billing Address created" if billing_address.save

  shipping_address = Address.new(street_address: "456 Herp Blvd", zipcode: "12345", phone_number: "123-4567", user_id: user.id, address_type_id: shipping_address_type.id, city_id: city.id, state_id: state.id, country_id: country.id)
  puts "Shipping Address created" if shipping_address.save

  # set both addresses as the User's default addresses
  user.default_billing_address_id = billing_address.id
  user.default_shipping_address_id = shipping_address.id
  puts "User addresses set" if user.save

  # create Order
  order = Order.new(shipping_date: Time.now, fulfilled: false, user_id: user.id, shipping_address_id: shipping_address.id, billing_address_id: billing_address.id)
  puts "Order created" if order.save

  # create CreditCard
  credit_card = CreditCard.new(card_number: "1234567812345678", expiry_date: "2018-12-31", user_id: user.id)
  puts "CreditCard created" if credit_card.save

  # create ProductCategory
  product_category = ProductCategory.new(name: "Outdoor and Sport", description: "Outdoor and sporting goods.")
  puts "ProductCategory created" if product_category.save

  # create Product
  product = Product.new(name: "Backpack", description: "A nifty all-weather backpack", sku: "OUTBAC123", price: 10000, stock: 100, product_category_id: product_category.id)
  puts "Product created" if product.save

  # Create ShoppingCart
  shopping_cart = ShoppingCart.new(user_id: user.id)
  puts "ShoppingCart created" if shopping_cart.save

  # Create a ShoppingCartProduct
  shopping_cart_product = ShoppingCartProduct.new(product_id: product.id, shopping_cart_id: shopping_cart.id, quantity: 1)
  puts "ShoppingCartProduct created" if shopping_cart_product.save

  # Create an OrderProduct
  order_product = OrderProduct.new(product_id: product.id, order_id: order.id, quantity: 2)
  puts "OrderProduct created" if order_product.save
end

########################################

# create the Country model object
# we're assuming that we only have one Country, the USA
def create_country
  country = Country.new(name: "United States of America")
  if country.save
    puts "The Country: #{country.name} was created."
  else
    puts "Error creating Country model instance."
  end
end

# create 5 to 10 random State objects
# unaffected by seed multipler
def create_states
  country_id = Country.first.id
  num_states = rand(5..10)

  num_states.times do
    state = State.new(name: random_state, country_id: country_id)

    if state.save
      puts "The State: #{state.name} was created."
    else
      puts "Error creating State model instance."
    end
  end
end

# create at least 100 random City objects
# affected by seed multiplier
def create_cities(seed_multiplier = 1)
  state_ids = State.all.map { |state| state.id }

  # # determine a random number of Cities to create, with some variance
  num_cities = ((100 + rand(0..10)) * seed_multiplier).ceil

  num_cities.times do
    city = City.new(name: random_city, state_id: state_ids.sample)

    if city.save
      puts "The City: #{city.name} with state_id: #{city.state_id} was created."
    else
      puts "Error creating City model instance."
    end
  end
end

# seeds the database with test data
def seed_database
  delete_all_data_in_db

  create_country
  create_states
  create_cities
end

seed_database

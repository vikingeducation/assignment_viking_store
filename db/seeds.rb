# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def delete_all_data_in_db
  User.delete_all
  Address.delete_all
  Order.delete_all

  AddressType.delete_all
  City.delete_all
  State.delete_all
  Country.delete_all
end

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

  # begin
  #   order.save!
  # rescue Exception => e
  #   puts e.message
  #   puts e.backtrace.inspect
  # end
end


test

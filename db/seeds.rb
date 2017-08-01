# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Faker::Name.unique.clear # Clears used values for Faker::Name
Faker::UniqueGenerator.clear # Clears used values for all generators

# Destroy all existing tables
User.destroy_all
City.destroy_all
State.destroy_all
Address.destroy_all
Product.destroy_all
ShoppingCart.destroy_all
Category.destroy_all
ShippingOrder.destroy_all

SEED_MULTIPLIER = 1

# Create grouping of data from the same place
Faker::Config.random = Random.new(42)


def create_users
  records = SEED_MULTIPLIER * 50
  records.times do |i|
    u = User.new
      u.firstname = Faker::Name.first_name
      u.lastname = Faker::Name.last_name
      u.email = Faker::Internet.email
      u.phone_num = Faker::PhoneNumber.phone_number
      u.credit_card = Faker::Business.credit_card_number
     
      u.default_billing_addr_id = Address.pluck(:id).sample
      u.default_shipping_addr_id = Address.pluck(:id).sample
   
      u.save!
  end
end

def create_cities
  records = SEED_MULTIPLIER * 50
  records.times do |i|
    c = City.new
      c.name = Faker::Address.city
   
      c.save!
  end
end

def create_states
  records = SEED_MULTIPLIER * 5
  records.times do |i|
    s = State.new
      s.name = Faker::Address.state
   
      s.save!
  end
end

def create_addresses
  records = SEED_MULTIPLIER * 50
  records.times do |i|
    a = Address.new
      a.building_number = Faker::Address.building_number
      a.street_name = Faker::Address.street_name
      a.state_id = State.pluck(:id).sample
      a.city_id = City.pluck(:id).sample
      a.zip = Faker::Address.zip_code
      a.address_type = ["B", "S"].sample
      a.default_flag = [1, 0].sample
   
      a.save!
  end
end

def create_categories
  records = SEED_MULTIPLIER * 3
  records.times do |i|
    c = Category.new
     c.name = Faker::Commerce.unique.department
     c.description = Faker::Lorem.sentence 

     c.save!
  end
end

def create_products
  records = SEED_MULTIPLIER * 15
  records.times do |i|
    p = Product.new
      p.name = Faker::Commerce.unique.product_name
      p.description = Faker::Lorem.sentence  
      p.price = Faker::Commerce.price
      p.sku = Faker::Lorem.characters(10)
      p.category_id = Category.pluck(:id).sample
   
      p.save!
  end
end

def create_shopping_carts
  records = SEED_MULTIPLIER * 15
   records.times do |i|
    sc = ShoppingCart.new
      sc.user_id = User.pluck(:id).sample
      sc.product_id = Product.pluck(:id).sample
      sc.quantity = rand(1..25) 
      sc.total = 
   
      sc.save!
  end
end


def create_orders
  records = SEED_MULTIPLIER * 50
   records.times do |i|
    o = ShippingOrder.new
      o.user_id = User.pluck(:id).sample
      o.default_shipping_addr_id = Address.pluck(:id).sample
      o.default_billing_addr_id = Address.pluck(:id).sample
      o.save!
  end
end

create_states
create_cities
create_addresses
create_users
create_categories
create_products
create_shopping_carts
create_orders
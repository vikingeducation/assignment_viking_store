# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)





# Clear all existing tables
def clear_seeds
  Address.destroy_all
  CreditCard.destroy_all
  OrderProduct.destroy_all
  Order.destroy_all
  ProductCategory.destroy_all
  ProductDetail.destroy_all
  Product.destroy_all
  Shipment.destroy_all
  User.destroy_all
end

clear_seeds


# build in seed multiplier


# Create 100 users.
# This fails but continues looping if email is not unique,
# which guarantees that I'll end up with the right number
# of users even if Faker randomly tries to make duplicates

def generate_users
  while User.count < 100 do

    u = User.new
    u.email = Faker::Internet.email
    u.first_name = Faker::Name.first_name
    u.last_name = Faker::Name.last_name
    u.phone = Faker::PhoneNumber.phone_number

    u.save

  end
end


# Create 100 city options (not affected by seed mult)
def generate_cities
  city_options = Array.new(100){ Faker::Address.city }.uniq
  while city_options.size < 100 do
    city_options << Faker::Address.city
    city_options.uniq!
  end
end


# Create 5-10 state options (not affected by seed mult)
def generate_states
  state_options = Array.new(8){ Faker::Address.state_abbr }.uniq
  while state_options.size < 8 do
    state_options << Faker::Address.state_abbr
    state_options.uniq!
  end
end


# Generate 0 to 5 addresses for each user, picking one for default billing & one for default shipping; randomize ZIP codes
def generate_user_orders
  User.all.each do |user|

    # Assume 80% of users have placed orders
    if rand < 0.8
      generate_addresses(user)
      generate_cards(user)
      generate_orders(user)
    end


    # Assume 25% of all users have active shopping carts
    generate_order_without_shipment(user) if rand < 0.25

  end
end


# Generate 0 to 5 addresses for each user
def generate_addresses(user)
  rand(0..5).times do
    a = Address.new
    a.first_name = user.first_name
    a.last_name = user.last_name
    a.street_address_1 = Faker::Address.street_address
    a.street_address_2 = Faker::Address.secondary_address if rand < 0.4
    a.city = city_options.sample
    a.state = state_options.sample
    a.zip = Faker::Address.zip[0..4]
    a.default_shipping = false
    a.default_billing = false
    a.user_id = user.id

    a.save!
  end

  # Pick default addresses
  user_addresses = Address.where(:user_id => user.id)
  unless user_addresses.empty?
    user_addresses.sample.update(:default_shipping => true)
    user_addresses.sample.update(:default_billing => true)
  end
end


  # Create cards for 80% of users
def generate_cards(user)
  rand(1..3).times do
    c = CreditCard.new
    c.number = Faker::Business.credit_card_number
    c.expiration_month = rand(1..12)
    c.expiration_year = rand(2016..2018)
    c.security_code = rand(100..9999)
    c.default_billing = true
    c.user_id = user.id
  end
end


# Create 100 orders (plus shipments) for the past year, growing over time
def generate_orders(user)
  o = Order.new
  o_p = OrderProduct.new
  s = Shipment.new

  o.user_id = user.id
  o.billing_address_id = Address.where(:user_id => o.user_id, :default_billing => true)
  o.billing_card_id = CreditCard.where(:user_id => o.user_id, :default_billing => true)

  s.tracking_number = Faker::Lorem.characters(18)
  s.shipping_date = Time.now
  s.shipping_address_id = Address.where(:user_id => o.user_id, :default_shipping => true)
  s.order_id = o.id

  o.shipment_id = s.id

  o_p.order_id = o.id
  o_p.product_id = Product.order("RANDOM()").first
  o_p.quantity = rand(1..4)

  o.save!
  s.save!
  o_p.save!
end


def generate_order_without_shipment(user)
  o = Order.new
  o_p = OrderProduct.new

  o.user_id = user.id
  o.billing_address_id = Address.where(:user_id => o.user_id, :default_billing => true)
  o.billing_card_id = CreditCard.where(:user_id => o.user_id, :default_billing => true)

  o_p.order_id = o.id
  o_p.product_id = Product.order("RANDOM()").first
  o_p.quantity = rand(1..4)

  o.save!
  o_p.save!
end



# Create 6 product categories
def generate_categories
  while ProductCategory.count < 6 do
    c = ProductCategory.new
    c.name = Faker::Commerce.department
    c.description = Faker::Lorem.sentence

    c.save
  end
end


# Create 2-5 products per category
def generate_products
  ProductCategory.all.each do |category|

    rand(2..5).times do
      product = Product.new
      detail = ProductDetail.new

      detail.title = Faker::Commerce.product_name
      detail.description = Faker::Lorem.paragraph(3)
      detail.price = Faker::Commerce.price
      detail.product_category_id = category.id
      detail.save!

      product.sku = Faker::Lorem.characters(16)
      product.product_detail_id = detail.id
      product.save!
    end

  end
end
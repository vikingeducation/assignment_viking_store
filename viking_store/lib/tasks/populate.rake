module Faker
  class MakeDate < Base
    class << self
      def months_ago(months=1)
        #return a random day in the past 7 days
        today = ::Date.today
        today = today.downto(today - (30*months)).to_a
        today.shuffle[0]
      end
    end
  end
end


namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    SCALE = 2
    
    generate_addresses
    generate_users
    generate_categories
    generate_products
    generate_orders

    make_users
    make_address
    make_product
    make_category
    make_credit_card
    make_order_details
    make_order

  end
end

def generate_addresses
  @addresses = (1..(100*SCALE)).to_a
end

def generate_users
  @users = (1..(300*SCALE)).to_a
end

def generate_categories
  @categories = (1..(6*SCALE)).to_a
end

def generate_products
  @products = (1..(50*SCALE)).to_a
end

def generate_orders
  @orders = (1..(200*SCALE)).to_a
end

def make_product
  (@products.size).times do |n| #create products
    title = Faker::Commerce.product_name
    description = Faker::Hacker.say_something_smart
    price = Faker::Commerce.price
    sku_num = Faker::Lorem.characters(6)
    create = Faker::MakeDate.months_ago(2)
    category_id = @categories.sample
    Product.create!(title: title, description: description,
      price: price, sku_num: sku_num, category_id: category_id, created_at: create)
  end
end

def make_users 
  (10*SCALE).times do |n| #users from 6 months ago
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    phone = Faker::Number.number(10)
    create = Faker::MakeDate.months_ago(6)
    billing_address = @addresses.sample
    shipping_address = @addresses.sample
    User.create!(first_name: first_name, last_name: last_name, 
    email: email, phone_number: phone, created_at: create,
    default_billing_id: billing_address,
    default_shipping_id: shipping_address)
  end

  (20*SCALE).times do |n| #users from 5 months ago
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    phone = Faker::Number.number(10)
    create = Faker::MakeDate.months_ago(5)
    billing_address = @addresses.sample
    shipping_address = @addresses.sample
    User.create!(first_name: first_name, last_name: last_name, 
    email: email, phone_number: phone, created_at: create,
    default_billing_id: billing_address,
    default_shipping_id: shipping_address)
  end

  (40*SCALE).times do |n| #40 users from 4 months ago
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    phone = Faker::Number.number(10)
    create = Faker::MakeDate.months_ago(4)
    billing_address = @addresses.sample
    shipping_address = @addresses.sample
    User.create!(first_name: first_name, last_name: last_name, 
    email: email, phone_number: phone, created_at: create,
    default_billing_id: billing_address,
    default_shipping_id: shipping_address)
  end

  (60*SCALE).times do |n| #60 users from 3 months ago
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    phone = Faker::Number.number(10)
    create = Faker::MakeDate.months_ago(3)
    billing_address = @addresses.sample
    shipping_address = @addresses.sample
    User.create!(first_name: first_name, last_name: last_name, 
    email: email, phone_number: phone, created_at: create,
    default_billing_id: billing_address,
    default_shipping_id: shipping_address)
  end

  (80*SCALE).times do |n| #80 users from 2 months ago
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    phone = Faker::Number.number(10)
    create = Faker::MakeDate.months_ago(2)
    billing_address = @addresses.sample
    shipping_address = @addresses.sample
    User.create!(first_name: first_name, last_name: last_name, 
    email: email, phone_number: phone, created_at: create,
    default_billing_id: billing_address,
    default_shipping_id: shipping_address)
  end

  (120*SCALE).times do |n| #120 users from 1 months ago
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    phone = Faker::Number.number(10)
    create = Faker::MakeDate.months_ago(1)
    billing_address = @addresses.sample
    shipping_address = @addresses.sample
    User.create!(first_name: first_name, last_name: last_name, 
    email: email, phone_number: phone, created_at: create,
    default_billing_id: billing_address,
    default_shipping_id: shipping_address)
  end

end

def make_address
   (1..@users.length).each do |n| #everyone gets a first address
    street = Faker::Address.street_address
    city = Faker::Address.city
    state = Faker::Address.state_abbr
    zip = Faker::Address.zip
    Address.create(user_id: n, street_address: street,
      city: city, state: state, zip: zip)
   end
  (1..((@users.length)/2)).each do |n| #half the users get a second address
    street = Faker::Address.street_address
    city = Faker::Address.city
    state = Faker::Address.state_abbr
    zip = Faker::Address.zip
    Address.create(user_id: n, street_address: street,
      city: city, state: state, zip: zip)
   end

   (1..((@users.length)/3)).each do |n| #one-third of users get a third address
    street = Faker::Address.street_address
    city = Faker::Address.city
    state = Faker::Address.state_abbr
    zip = Faker::Address.zip
    Address.create(user_id: n, street_address: street,
      city: city, state: state, zip: zip)
   end

  (1..((@users.length)/4)).each do |n| #one-fourth of users get a fourth address
    street = Faker::Address.street_address
    city = Faker::Address.city
    state = Faker::Address.state_abbr
    zip = Faker::Address.zip
    Address.create(user_id: n, street_address: street,
      city: city, state: state, zip: zip)
   end

  (1..((@users.length)/5)).each do |n| #one-fifth of users get a fifth address
    street = Faker::Address.street_address
    city = Faker::Address.city
    state = Faker::Address.state_abbr
    zip = Faker::Address.zip
    Address.create(user_id: n, street_address: street,
      city: city, state: state, zip: zip)
   end
end

def make_credit_card
  months, years = [],[]
  type = " "
  (1..12).each {|i| months << i}
  (2014..2020).each {|i| years << i}
  (1..@users.length).each do |n|
      cc = Faker::Number.number(16)
      exp_month = months.sample
      exp_year = years.sample
      CreditCard.create!(user_id: n, card_number: cc, expiration_month: exp_month,
        experiation_year: exp_year, type: type)
  end
end

def make_category
  (1..@categories.length).each do |n| #6 categories
    title = Faker::Lorem.words(2)[0]
    description = Faker::Hacker.say_something_smart
    Category.create!(title: title, description: description)
  end
end


def make_order_details
  (1..(@orders.length/2)).each do |i| 
    product_id = @products.sample
    quantity = (1..10).to_a.sample
    current_price = Product.find(product_id).price
    order_total = (quantity) * (current_price) 
    OrderDetail.create!(product_id: product_id,
      order_id: i, quantity: quantity, price: order_total)
  end

  (1..@orders.length).each do |n|
    product_id = @products.sample
    quantity = (1..10).to_a.sample
    current_price = Product.find(product_id).price
    order_total = (quantity) * (current_price)
    OrderDetail.create!(product_id: product_id,
      order_id: ((1..@orders.length).to_a.sample), quantity: quantity, price: order_total)
  end
end


def make_order
  (@orders.length/2).times do |i| 
    user_id = rand(1..50*SCALE)
    billing = Address.where(user_id: user_id).sample.id
    shipping = Address.where(user_id: user_id).sample.id
    placed_at = Faker::MakeDate.months_ago(4)
    checkout_time = placed_at + rand(14).days
    Order.create!(user_id: user_id, billing_address_id: billing,
      shipping_address_id: shipping, created_at: placed_at, checked_out: true, checkout_time: checkout_time)
  end

  (@orders.length).times do |i| #100-scaled non-placed orders (carts)
    user_id = rand(1..50*SCALE)
    billing = Address.where(user_id: user_id).sample.id
    shipping = Address.where(user_id: user_id).sample.id
    placed_at = Faker::MakeDate.months_ago(4)
    Order.create!(user_id: user_id, billing_address_id: billing,
      shipping_address_id: shipping, checked_out: false, created_at: placed_at)
  end

end
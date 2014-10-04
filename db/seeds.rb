# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


module Faker
  class MakeDate < Base
    class << self
      def months_ago(months=1)
        today = ::Date.today
        today = today.downto(today - (30*months)).to_a
        today.shuffle[0]
      end
    end
  end
end

def gen_addresses
   @addresses = (1..100).to_a
end

def gen_users
  @users = (1..330).to_a
end

def gen_categories
  @categories = (1..6).to_a
end

def gen_products
  @products = (1..50).to_a
end

def gen_orders
  @orders = (1..200).to_a
end

def gen_products
  100.times do |n|
    product = Faker::Commerce.product_name
    product_description = Faker::Hacker.say_something_smart
    price = Faker::Commerce.price
    sku = Faker::Lorem.characters(6)
    create = Faker::MakeDate.months_ago(2)
    category_id = rand(1..100)
    Product.create!(:product => product, :product_description => product_description, :price => price, :sku => sku, :category_id => category_id, :created_at => create)
  end
end

def make_users
  [6,5,4,3,2,1].each do |x|
    20.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = Faker::Internet.email
      phone = Faker::Number.number(10)
      create = Faker::MakeDate.months_ago(x)
      billing_address = rand(1..120)
      shipping_address = rand(1..120)
      User.create!(:first_name => first_name, :last_name => last_name, 
      :email => email, :phone => phone, :created_at => create,
      :default_billing => billing_key,
      :default_shipping => shipping_key)
    end
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

def make_payment
  months, years = [],[]
  (1..12).each {|i| months << i}
  (2014..2020).each {|i| years << i}
  (1..@users.length).each do |n|
      cc = Faker::Number.number(16)
      exp_month = months.sample
      exp_year = years.sample
      ccv = rand(999)
      Payment.create!(user_id: n, cc_number: cc, exp_month: exp_month,
        exp_year: exp_year, ccv: ccv)
  end
end

def make_category
  (1..@categories.length).each do |n| #6 categories
    name = Faker::Lorem.words(2)[0]
    description = Faker::Hacker.say_something_smart
    Category.create!(name: name, description: description)
  end
end


def make_order_contents
  (1..100).each do |i| #100-scaled initial orders
    product_id = @products.sample
    quantity = (1..10).to_a.sample
    OrderContent.create!(product_id: product_id,
      order_id: i, quantity: quantity)
  end

  (1..@orders.length).each do |n|
    product_id = @products.sample
    quantity = (1..10).to_a.sample
    OrderContent.create!(product_id: product_id,
      order_id: (100+n), quantity: quantity)
  end
end


def make_order
  100.times do |i| #100 placed orders
    user_id = @users.sample
    billing = Address.where(user_id: user_id).sample.id
    shipping = Address.where(user_id: user_id).sample.id
    placed_at = Faker::MakeDate.months_ago(4)
    Order.create!(user_id: user_id, billing_address_id: billing,
      shipping_address_id: shipping, is_placed: true, placed_at: placed_at)
  end

  (@orders.length).times do |i| #100-scaled non-placed orders (carts)
    user_id = @users.sample
    billing = Address.where(user_id: user_id).sample.id
    shipping = Address.where(user_id: user_id).sample.id
    placed_at = Faker::MakeDate.months_ago(4)
    Order.create!(user_id: user_id, billing_address_id: billing,
      shipping_address_id: shipping, is_placed: false, placed_at: placed_at)
  end

end
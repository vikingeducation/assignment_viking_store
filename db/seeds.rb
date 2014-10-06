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

def gen_address_apt
  @address_apt = (1..1000).to_a
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

def gen_orders_contents
  @orders_contents= (1..600).to_a # assume a avg order of 3 items
end

def make_address
   (1..@users.length).each do |n| #everyone gets a first address
    address_line_1 = Faker::Address.street_address
    address_line_2 = @address_apt.sample
    city = Faker::Address.city
    state = Faker::Address.state_abbr
    zipcode = Faker::Address.zip
    Address.create(user_id: n, address_line_1: address_line_1, address_line_2: address_line_2,
      city: city, state: state, zipcode: zipcode)
   end
end

def make_billings
  (1..@users.length).each do |n| #everyone gets a first address
    address_line_1 = Faker::Address.street_address
    address_line_2 = @address_apt.sample
    city = Faker::Address.city
    state = Faker::Address.state_abbr
    zipcode = Faker::Address.zip
    Address.create(user_id: n, address_line_1: address_line_1, address_line_2: address_line_2,
      city: city, state: state, zipcode: zipcode)
  end
end

def make_products
  (1..@products.length).each do |n| #everyone gets a first address
    product = Faker::Commerce.product_name
    product_description = Faker::Hacker.say_something_smart
    price = Faker::Commerce.price
    sku = Faker::Lorem.characters(6)
    create = Faker::MakeDate.months_ago(2)
    category_id = rand(1..100)
    Product.create!(:product => product, :product_description => product_description, :price => price, :sku => sku, :category_id => category_id, :created_at => create)
  end
end

def make_category
  (1..@categories.length).each do |n| #6 categories
    category_id = @categories.sample
    name = Faker::Lorem.words(2)[0]
    description = Faker::Hacker.say_something_smart
    Category.create!(category_id: category_id, category_name: name, category_description: description)
  end
end

def make_order
 (1..@orders.length).each do |n|
    order_id = @orders.sample
    user_id = @users.sample
    billing_address = @addresses.sample
    shipping_address = @addresses.sample
    when_placed = Faker::MakeDate.months_ago( rand(0..6) )
    Order.create!(order_id: order_id, user_id: user_id, billing_address: billing_address, shipping_address: shipping_address, when_placed: when_placed)
  end
end

def make_payment
  months, years = [],[]
  (1..12).each {|i| months << i}
  (2014..2020).each {|i| years << i}
  (1..@users.length).each do |n|
      cc_last_4 = Faker::Number.number(4) # only the last 4 digits of the cc #
      exp = ("months.sample" + "years.sample").to_i
      cvv = rand(999)
      Payment.create!(user_id: n, cc_last_4: cc_last_4, exp: exp, cvv: cvv)
  end
end

def make_order_contents
  (1..gen_orders_contents.length).each do |n| #everyone gets a first address
    sku = @products.sample
    order_id = @orders.sample
    quantity = (1..10).to_a.sample
    current_price = Faker::Commerce.price
    OrderContent.create!(sku: sku, order_id: order_id, quantity: quantity, current_price: current_price)
  end
end

def make_users
  [6,5,4,3,2,1].each do |x| # 6 months
      (1..@users.length).each do |n| #everyone gets a first address
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = Faker::Internet.email
      phone = Faker::Number.number(10)
      create = Faker::MakeDate.months_ago(x)
      default_shipping = rand(1..120)
      default_billing = rand(1..120)
      User.create!(:first_name => first_name, :last_name => last_name,
      :user_email => email, :phone => phone, :created_at => create,
      :default_billing => default_billing,
      :default_shipping => default_shipping)
    end
  end

end

# clean all the previous data out of the DB
def delete_all
  User.delete_all
  Address.delete_all
  Billing.delete_all
  OrderContent.delete_all
  Order.delete_all
  Category.delete_all
  Payment.delete_all
  Product.delete_all
end
###############

delete_all
gen_addresses
gen_address_apt
gen_users
gen_categories
gen_products
gen_orders
gen_orders_contents
make_address
make_billings
make_products
make_category
make_order
make_payment
make_order_contents
make_users

namespace :db do
  desc 'Clear the database and fill with excellent fake data'
  task :populate => :environment do
    require 'populator'
    require 'faker'

    puts "Starting populator...\n\n"
    start_time = Time.now
    MULTIPLIER = 5




    # Blow away the existing data
    puts "Removing old data..."
    tables = [LineItem, Cart, Order, CreditCard, Address, Product, User, Category, City]

    tables.each do |table|
      table.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!(table.table_name)
    end
    puts "Old data removed.\n\n"




    # Cities
    puts "Creating Cities..."
    City.populate(MULTIPLIER * 50) do |city|
      city.name = Faker::Address.city
    end
    puts "Cities created.\n\n"

    # Building range for future reference
    city_arr = (City.first.id..City.last.id).to_a
    state_arr = (State.first.id..State.last.id).to_a

    # Weighting first 4 cities and states more heavily
    4.times do |i|
      3.times{city_arr << city_arr[i]}
      3.times{state_arr << state_arr[i]}
    end




    # Users, Credit Cards, Addresses
    puts "Creating users, credit cards, and addresses..."
    User.populate(MULTIPLIER * 20) do |user|
      user.email = Faker::Internet.email
      user.first_name = Faker::Name.first_name
      user.last_name = Faker::Name.last_name
      user.phone_number = Faker::PhoneNumber.phone_number

      CreditCard.populate(1..3) do |card|
        card.user_id = user.id
        card.name_on_card = "#{user.first_name} #{user.last_name}"
        card.card_number = Faker::Business.credit_card_number
        card.expiration = Faker::Business.credit_card_expiry_date
      end # Credit Card

      Address.populate(0..5) do |address|
        address.user_id = user.id
        address.default_shipping = false
        address.default_billing = false
        address.line_1 = Faker::Address.street_address
        random_number = rand(1..3)
        if random_number == 3
          address.line_2 = Faker::Address.secondary_address
        end
        address.city_id = city_arr.sample
        address.state_id = state_arr.sample
        address.zip = Faker::Address.zip_code
      end # Address
    end # User

    # Make first Billing and Shipping addresses the default ones
    User.all.each do |user|
      a = Address.find_by_user_id(user.id)
      if a
        a.default_shipping = true
        a.default_billing = true
        a.save
      end
    end
    puts "Users, credit cards, and addresses created.\n\n"




    # Categories and Products
    puts "Creating categories and products..."
    Category.populate(MULTIPLIER * 3) do |category|
      category.description = Faker::Commerce.department

      Product.populate(10..30) do |product|
        product.title = Faker::Commerce.product_name
        product.description = Faker::Company.bs
        product.category_id = category.id
        product.price = Faker::Commerce.price
        product.SKU_number = Faker::Code.ean
      end # Product
    end # Category
    puts "Categories and products created.\n\n"




    # Carts
    user_range = (User.first.id..User.last.id)
    product_range = (Product.first.id..Product.last.id)

    puts "Creating carts and associated line items..."
    Cart.populate(MULTIPLIER * 5) do |cart|
      cart.user_id = rand(user_range)

      LineItem.populate(1..3) do |item|
        product = Product.find(rand(product_range))
        item.product_id = product.id
        item.quantity = rand(1..3)
        item.price = product.price
        item.cart_id = cart.id
      end # Line Item
    end # Cart
    puts "Carts with line items created.\n\n"




    # Orders
    puts "Creating orders and associated line items..."
    Order.populate(MULTIPLIER * 20) do |order|
      address = Address.all.sample
      order.user_id = address.user_id
      order.shipping_address_id = address.id
      order.billing_address_id = address.id
      order.credit_card_id = CreditCard.find_by_user_id(address.user_id)

      LineItem.populate(1..3) do |item|
        product = Product.find(rand(product_range))
        item.product_id = product.id
        item.quantity = rand(1..3)
        item.price = product.price
        item.order_id = order.id
      end # Line Item

    end # Order
    puts "Orders with line items created.\n\n"

    puts "ALL DONE! ...in #{Time.now - start_time} seconds."
  end
end
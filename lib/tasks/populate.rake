namespace :db do
  desc 'Clear the database and fill with excellent fake data'
  task :populate => :environment do
    require 'populator'
    require 'faker'

    puts "Starting populator...\n\n"
    start_time = Time.now

    puts "Removing old data..."
    # Blow away the existing data
    tables = [BillingAddress, ShippingAddress, Cart, Category, City, CreditCard, LineItem, Order, Product, User]

    tables.each do |table|
      table.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!(table.table_name)
    end
    puts "Old data removed.\n"

    MULTIPLIER = 5

    # Cities
    puts "Creating Cities..."
    City.populate(MULTIPLIER * 50) do |city|
      city.name = Faker::Address.city
    end
    puts "Cities created.\n"

    city_range = (City.first.id..City.last.id)
    state_range = (State.first.id..State.last.id)

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

      ShippingAddress.populate(1..2) do |address|
        address.user_id = user.id
        address.default_shipping = false
        address.line_1 = Faker::Address.street_address
        random_number = rand(1..3)
        if random_number == 3
          address.line_2 = Faker::Address.secondary_address
        end
        address.city_id = rand(city_range)
        address.state_id = rand(state_range)
        address.zip = Faker::Address.zip_code
      end # Shipping Address

      BillingAddress.populate(1..2) do |address|
        address.user_id = user.id
        address.default_billing = false
        address.line_1 = Faker::Address.street_address
        random_number = rand(1..3)
        if random_number == 3
          address.line_2 = Faker::Address.secondary_address
        end
        address.city_id = rand(city_range)
        address.state_id = rand(state_range)
        address.zip = Faker::Address.zip_code
      end # Billing Address

    end # User

    # Make first Billing and Shipping addresses the default ones
    User.all.each do |user|
      s = ShippingAddress.find_by_user_id(user.id)
      s.default_shipping = true
      s.save

      b = BillingAddress.find_by_user_id(user.id)
      b.default_billing = true
      b.save
    end

    puts "Users, credit cards, and addresses created."

  end
end
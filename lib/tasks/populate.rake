namespace :db do
  desc 'Clear the database and fill with excellent fake data'
  task :populate => :environment do
    require 'populator'
    require 'faker'

    puts "Starting populator...\n\n"
    start_time = Time.now

    puts "Removing old data..."
    # Blow away the existing data
    tables = [Address, Cart, Category, City, CreditCard, LineItem, Order, Product, User]

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

    puts "Users, credit cards, and addresses created."

  end
end
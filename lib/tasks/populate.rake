namespace :db do
  desc 'Clear the database and fill with excellent fake data'
  task :populate => :environment do
    require 'populator'
    require 'faker'

    puts "Starting populator...\n\n"
    start_time = Time.now

    puts "Removing old data..."
    # Blow away the existing data
    tables = [BillingAddress, Cart, Category, City, CreditCard, LineItem, Order, Product, ShippingAddress, User]

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

    end # User
    puts "Users, credit cards, and addresses created."

  end
end
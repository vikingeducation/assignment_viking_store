# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def reset_database
  User.delete_all
  Profile.delete_all
  CreditCard.delete_all
  Address.delete_all
  Product.delete_all
  Category.delete_all
  Order.delete_all
  OrderProduct.delete_all
end

def create_credit_card
  CreditCard.create(
    number: Faker::Business.credit_card_number,
    expiry_date: Faker::Business.credit_card_expiry_date,
    flag: Faker::Business.credit_card_type
  )
end

def create_address
  Address.create(
    line_1: Faker::Address.street_address,
    line_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    zip_code: Faker::Address.zip_code,
  )
end

# Have at least 100 users. Stagger their join dates any time in the last year.
# Show growth in the rate of user signups over time.
def create_users
  # credit card id
  # shipping address id
  # billing address id
  # profile id
  num_users = 100
  num_users.times do
    User.create(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      profile_id:  # TODO
    )
  end

end

# Run
puts "Starting seeds...\n\n"

puts "Removing old data..."
reset_database
puts "Old data removed.\n\n"

create_users

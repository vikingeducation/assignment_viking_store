# ---
# Constants
# ---
STATES = [
  "Alabama",
  "Alaska",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming"
]

MULTIPLIER = 1


# Remove existing data
Address.delete_all
Category.delete_all
City.delete_all
Product.delete_all
State.delete_all
User.delete_all



# create_states
STATES.sample(10).each do |state_name|
  State.create(:name => state_name)
end

# create_cities
num_cities = 100 * MULTIPLIER

num_cities.times do
  City.create(:name => Faker::Address.city)
end


# create_addresses
MULTIPLIER.times do
  Address.create(
    line_1: Faker::Address.street_address,
    line_2: Faker::Address.secondary_address,
    city: City.pluck(:id).sample,
    state: State.pluck(:id).sample,
    zip: Faker::Address.zip
  )
end
# create_users
num_users = 100 * MULTIPLIER

num_users.times do
  mail_add, bill_add = Address.pluck(:id).sample(2)
  bill_add = mail_add if [true, false].sample
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    default_mail: mail_add,
    default_bill: bill_add,
    phone: Faker::PhoneNumber.phone_number
  )
end

# create_categories
num_categories = 6
num_categories.times do
  Category.create(
    name: Faker::Commerce.unique.department,
    description: Faker::Simpsons.quote
  )
end

# create_products
num_products = 15 * MULTIPLIER

num_products.times do
  Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Seinfeld.quote,
    price: Faker::Commerce.price,
    sku: Faker::Number.hexadecimal(5)
    # Must add category
  )


end


  #

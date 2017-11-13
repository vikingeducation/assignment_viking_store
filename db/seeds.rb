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
Order.delete_all
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
num_addresses = MULTIPLIER * 100
num_addresses.times do
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
    default_mail_address_id: mail_add,
    default_bill_address_id: bill_add,
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
    sku: Faker::Number.hexadecimal(5),
    category_id: Category.pluck(:id).sample
  )
end

# create_orders
num_orders = 10 * MULTIPLIER
[true, false].sample ? placed_date = nil : placed_date = Faker::Time.between(365.days.ago, Date.today, :all)

num_orders.times do
  order_user_id = User.pluck(:id).sample
  Order.create(
    user_id: order_user_id,
    placed_date: placed_date,
    mail_address_id: User.find(order_user_id).default_mail_address_id,
    bill_address_id: User.find(order_user_id).default_bill_address_id,
  )
end

# seed orders_products
num_orders_products = 25 * MULTIPLIER

num_orders_products.times do
  Orders_products.create(
    order_id: Order.pluck(:id).sample,
    product_id: Product.pluck(:id).sample,
    product_quantity: rand(6)
  )

end




  #

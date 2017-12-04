require 'faker'


MULTIPLIER = 1

def creation_date
  time_frames = []
  (MULTIPLIER**2).times do |x|
     time_frames << Date.today - (MULTIPLIER + rand(1..36) ).month
  end
  date_range = (time_frames.sample..(Date.today))
  rand(date_range)
end

# ----------------------------
# DESTROY ALL DATA
# ----------------------------
puts "Deleting ALL current data"
CartItem.destroy_all
OrderItem.destroy_all
Product.destroy_all
Category.destroy_all
Cart.destroy_all
Order.destroy_all
Address.destroy_all
State.destroy_all
User.destroy_all


# ----------------------------
# GENERATE SEEDS
# ----------------------------

# STATES --------------------
puts "Generating US States"
state_data = [
  {name: 'Alabama', abbv: 'AL'},
  {name: 'Alaska', abbv: 'AK'},
  {name: 'Arizona', abbv: 'AZ'},
  {name: 'Arkansas', abbv: 'AR'},
  {name: 'California', abbv: 'CA'},
  {name: 'Colorado', abbv: 'CO'},
  {name: 'Connecticut', abbv: 'CT'},
  {name: 'Delaware', abbv: 'DE'},
  {name: 'Florida', abbv: 'FL'},
  {name: 'Georgia', abbv: 'GA'},
  {name: 'Hawaii', abbv: 'HI'},
  {name: 'Idaho', abbv: 'ID'},
  {name: 'Illinois', abbv: 'IL'},
  {name: 'Indiana', abbv: 'IN'},
  {name: 'Iowa', abbv: 'IA'},
  {name: 'Kansas', abbv: 'KS'},
  {name: 'Kentucky', abbv: 'KY'},
  {name: 'Louisiana', abbv: 'LA'},
  {name: 'Maine', abbv: 'ME'},
  {name: 'Maryland', abbv: 'MD'},
  {name: 'Massachusetts', abbv: 'MA'},
  {name: 'Michigan', abbv: 'MI'},
  {name: 'Minnesota', abbv: 'MN'},
  {name: 'Mississippi', abbv: 'MS'},
  {name: 'Missouri', abbv: 'MO'},
  {name: 'Montana', abbv: 'MT'},
  {name: 'Nebraska', abbv: 'NE'},
  {name: 'Nevada', abbv: 'NV'},
  {name: 'New Hampshire', abbv: 'NH'},
  {name: 'New Jersey', abbv: 'NJ'},
  {name: 'New Mexico', abbv: 'NM'},
  {name: 'New York', abbv: 'NY'},
  {name: 'North Carolina', abbv: 'NC'},
  {name: 'North Dakota', abbv: 'ND'},
  {name: 'Ohio', abbv: 'OH'},
  {name: 'Oklahoma', abbv: 'OK'},
  {name: 'Oregon', abbv: 'OR'},
  {name: 'Pennsylvania', abbv: 'PA'},
  {name: 'Rhode Island', abbv: 'RI'},
  {name: 'South Carolina', abbv: 'SC'},
  {name: 'South Dakota', abbv: 'SD'},
  {name: 'Tennessee', abbv: 'TN'},
  {name: 'Texas', abbv: 'TX'},
  {name: 'Utah', abbv: 'UT'},
  {name: 'Vermont', abbv: 'VT'},
  {name: 'Virginia', abbv: 'VA'},
  {name: 'Washington', abbv: 'WA'},
  {name: 'West Virginia', abbv: 'WV'},
  {name: 'Wisconsin', abbv: 'WI'},
  {name: 'Wyoming', abbv: 'WY'}
]

state_data.each do |state|
  State.find_or_create_by!(abbreviation: state[:abbv] ){ |s| s.name = state[:name] }
end


# PRODUCTS & CATEGORIES -------------------

15.times do
  # Generate Category name
  puts "Generating Categories"

  category = Category.create!(name: Faker::Commerce.unique.department)

  (MULTIPLIER * 3).times do
    # Generate Product for this category
    puts "Generating Products for #{category.name}"

    Product.create!(
      category_id: category.id,
      title: Faker::Commerce.unique.product_name,
      description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price,
      sku: Faker::Code.unique.asin
    )
  end #product
end #category


# USERS and ADDRESSES -------------------

# Generate Users
puts "Generating Users"

(MULTIPLIER * 6).times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.phone_number,
    password: 'password', encrypted_password: 'password',
    created_at: creation_date
  )
end

# Generate Users with addresses
puts "Generating Addresses for some Users"

# Generate User's Addresses
users = User.all.sample(MULTIPLIER * 3)
users.each do |user|
  puts "Building addresses for #{user.name}"
  6.times do
    Address.create!(
      user_id: user.id,
      street_1: Faker::Address.street_address,
      street_2: [Faker::Address.secondary_address, ""].sample,
      city: Faker::Address.city,
      state_id: State.all.sample.id,
      zip: Faker::Address.zip_code
    )
  end #timesdo

  # Assign User's Billing & Shipping Addresses
  puts "Setting address defaults for #{user.name}"
  addresses = user.addresses
  user.billing_address_id = addresses.sample.id
  user.shipping_address_id = addresses.sample.id
  user.save
end #user


# CART, ORDERS, & ITEMS -------------------

users = User.all.sample(MULTIPLIER * 4)
products = Product.all

puts "Generating cart and items for users"
users.each do |user|
  cart = Cart.create!(user_id: user.id)
  # Generate a random number of items for this cart
  rand(1..(MULTIPLIER * 2)).times do
    CartItem.create!({
      cart_id: cart.id,
      qty: rand(1..5),
      product_id: products.sample.id
    })
  end #items
end #users

puts "Generating orders for users"
users.each do |user|
  # Generate a random number of orders for this user
  rand(1..(MULTIPLIER * 2)).times do
    order = Order.create!(user_id: user.id, created_at: creation_date )
    # Generate a random number of items for this order
    rand(1..(MULTIPLIER * 2)).times do
      OrderItem.create!({
        order_id: order.id,
        qty: rand(1..5),
        product_id: products.sample.id
      })
    end #items
  end #orders
end #users

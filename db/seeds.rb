require 'faker'

MULTIPLIER = 1

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


# USERS, ADDRESSES, AND ORDERS -------------------
billing = AddressType.find_or_create_by!(name: 'Billing')
shipping = AddressType.find_or_create_by!(name: 'Shipping')

# Generate Users without addresses
puts "Generating Users"

(MULTIPLIER * 3).times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.phone_number,
    password: 'password', encrypted_password: 'password'
  )
end

# Generate Users with addresses
puts "Generating Users with addresses"

(MULTIPLIER * 3).times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.phone_number,
    password: 'password', encrypted_password: 'password')

  # Generate User's Shipping Addresses
  (MULTIPLIER * 3).times do
    Address.create!(
      user_id: user.id,
      address_type_id: shipping.id,
      default: false,
      street_1: Faker::Address.street_address,
      street_2: "",
      city: Faker::Address.city,
      state_id: State.all.sample.id,
      zip: Faker::Address.zip_code
    )
    # Generate User's Billing Address
    Address.create!(
      user_id: user.id,
      address_type_id: billing.id,
      default: false,
      street_1: Faker::Address.street_address,
      street_2: "",
      city: Faker::Address.city,
      state_id: State.all.sample.id,
      zip: Faker::Address.zip_code
    )
  end #addresses

  # Set a default shipping and billing address
  puts "Setting address defaults for #{user.name}"

  sa = user.addresses.where(address_type_id: shipping.id).first
  sa.update!(default: true)

  ba = user.addresses.where(address_type_id: billing.id).first
  ba.update!(default: true)
end #user


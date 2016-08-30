puts "Starting seeds...\n\n"
start_time = Time.now

puts "Removing old data..."
# Blow away the existing data
User.delete_all
Address.delete_all
State.delete_all
City.delete_all
Zipcode.delete_all
Country.delete_all
Product.delete_all
Order.delete_all
Orderitem.delete_all
Category.delete_all
puts "Old data removed.\n\n"

# increase your seed size by changing this
# NOTE: This can make it take MUCH longer!
# A value of 10 can take over 3 minutes
MULTIPLIER = 5

# CREATE STATES
STATES =
["Alabama", "Alaska", "Arizona", "Arkansas", "California",
"Colorado", "Connecticut", "Delaware", "Florida", "Georgia",
"Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
"Kansas", "Kentucky", "Louisiana", "Maine", "Maryland",
"Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri",
"Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
"New Mexico", "New York", "North Carolina", "North Dakota", "Ohio",
"Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina",
"South Dakota", "Tennessee", "Texas", "Utah", "Vermont",
"Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

#1.
puts "Creating Countries..."
Country.create( name: "USA")
puts "Countries created.\n\n"

#2.
puts "Creating States..."
STATES.each do |state_name|
  State.create(name: state_name,
               country_id: Country.pluck(:id).sample)
end
puts "States created.\n\n"

#3.
puts "Creating Cities..."
State.all.each do |state|
  MULTIPLIER.times do
    City.create( name: Faker::Address.city,
                 state_id: state.id )
  end
end
puts "Cities created.\n\n"

#4.
puts "Creating zipcodes..."
State.all.each do |state|
  MULTIPLIER.times do
    Zipcode.create( code: Faker::Address.zip_code )
  end
end
puts "Zipcodes created.\n\n"


#5.
puts "Creating Users..."
(MULTIPLIER * 2).times do
  fname =  Faker::Name.first_name
  lname = Faker::Name.last_name
  User.create( email: Faker::Internet.email("#{fname} #{lname}"),
               firstname: fname,
               lastname: lname  )
end
puts "Users created.\n\n"

#6.
puts "Creating Addresses..."
(MULTIPLIER * 2).times do
  Address.create( line_1: Faker::Address.street_address,
                  line_2: Faker::Address.secondary_address,
                  zip_code_id: Zipcode.pluck(:id).sample,
                  user_id: User.pluck(:id).sample)
end
puts "Addresses created.\n\n"

#7.
puts "Creating Categories..."
(MULTIPLIER * 2).times do
  Category.create( name: Faker::Book.genre )
end
puts "Categories created.\n\n"

#8.
puts "Creating Products..."
(MULTIPLIER * 10).times do
  Product.create( name: Faker::Commerce.product_name,
                  description: Faker::Hipster.sentence(3, false, 4),
                  category_id: Category.pluck(:id).sample,
                  units: rand(30),
                  sku_number: Faker::Code.isbn)
end
puts "Products created.\n\n"

#9.
puts "Creating Orders..."
(MULTIPLIER * 2).times do
  Order.create( order_date: Faker::Date.between(1.year.ago, Date.today),
                user_id: User.pluck(:id).sample,
                billing_id: Address.pluck(:id).sample,
                shipping_id: Address.pluck(:id).sample,
                phone: Faker::PhoneNumber.phone_number,
                credit_card: Faker::Business.credit_card_number)
end
puts "Orders created.\n\n"


#10.
puts "Creating Orderitem..."
Order.all.each do |order|
  (rand(1..3) ).times do
    Orderitem.create( order_id: order.id,
                      product_id: Product.pluck(:id).sample,
                      quantity: rand(3) + 1)
  end
end
puts "Orderitems created.\n\n"



puts "\n\nALL DONE!!!"
puts "It took #{Time.now - start_time} seconds."
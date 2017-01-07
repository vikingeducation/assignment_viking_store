puts "Starting seeds...\n\n"
start_time = Time.now

puts "Blowing away all existing models..."
User.delete_all
Address.delete_all
CreditCard.delete_all
City.delete_all
State.delete_all
Category.delete_all
Product.delete_all
Order.delete_all
ProductOrder.delete_all
puts "All destroyed \n\n\n"






MULTIPLIER = 1


puts "Creating user/order created_at items..."
users_created_at = []
(MULTIPLIER * 20).times { users_created_at << Faker::Time.between(1.year.ago, 6.months.ago) }
(MULTIPLIER * 30).times { users_created_at << Faker::Time.between(6.months.ago, 3.months.ago) }
(MULTIPLIER * 50).times { users_created_at << Faker::Time.between(3.months.ago, Date.today) }

orders_created_at = []
users_created_at.each do |datetime|
  orders_created_at << datetime.next_day
end



puts "Creating cities..."
(MULTIPLIER * 100).times do 
  City.create(name: Faker::Address.city)
end




puts "Creating states..."
STATES =
["Alabama", "Alaska", "Arizona", "Arkansas", "California",
"Colorado", "Connecticut", "Delaware", "Florida", "Georgia",
"Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
"Kansas", "Kentucky", "Louisiana", "Maine", "Maryland",
"Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri",
"Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
"New Mexico", "New York", "North Carolina", "North Dakota", "Ohio",
"Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont",
"Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

STATES.each do |state|
  State.create(name: state)
end





puts "Creating categories..."
(MULTIPLIER * 6).times do 
  Category.create(name: Faker::Pokemon.location)
end





puts "Creating products..."
(MULTIPLIER * 10).times do
  Product.create(category_id: Category.pluck(:id).sample,
                 name: Faker::Pokemon.name,
                 sku: Faker::Code.isbn,
                 price: Faker::Number.decimal(2, 2)
                 )
end




puts "Creating users..."
(MULTIPLIER * 100).times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              phone: Faker::PhoneNumber.phone_number,
              created_at: users_created_at.shift)
end





puts "Creating credit cards..."
User.all.each do |user|
  CreditCard.create(user_id: user.id,
                    address_id: user.default_billing_id,
                    number: Faker::Business.credit_card_number,
                    exp: rand(1..12).to_s + rand(17..25).to_s,
                    csv: Faker::Number.number(3)
                    )
end





puts "Creating addresses..."

clumps = City.pluck(:id).sample(MULTIPLIER*10)
User.all.each do |user|
  Address.create(user_id: user.id,
                 street: Faker::Address.street_address,
                 city_id: clumps.sample,
                 state_id: State.pluck(:id).sample,
                 zip: Faker::Address.zip)
end




puts "Assigning default addresses..."
User.all.each do |user|
  address_id = Address.find_by(:user_id => user.id).id
  User.update(user.id,
              :default_billing_id => address_id,
              :default_shipping_id => address_id)
end




puts "Creating orders..."
active_users = User.pluck(:id).sample(MULTIPLIER*75)
(MULTIPLIER * 100).times do
  user = active_users.sample
  user_billing = User.find_by(:id => user).default_billing_id
  Order.create(user_id: user,
               billing_id: user_billing,
               shipping_id: user_billing,
               checkout: orders_created_at.shift
                )
end





puts "Creating carts..."
(MULTIPLIER * 25).times do
  user = active_users.sample
  user_billing = User.find_by(:id => user).default_billing_id
  Order.create(user_id: user,
               billing_id: user_billing,
               shipping_id: user_billing,
                )
end





puts "Creating product-orders..."
Order.all.each do |order|
  ProductOrder.create(product_id: Product.pluck(:id).sample,
                      quantity: rand(5),
                      order_id: order.id)
end



puts "\n\nALL DONE!!!"
puts "It took #{Time.now - start_time} seconds."
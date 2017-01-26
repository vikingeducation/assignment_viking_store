# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Starting seeds...\n\n"
start_time = Time.now

puts "Removing old data..."
# Blow away the existing data

User.delete_all
Address.delete_all
Payment.delete_all
Product.delete_all
Category.delete_all
Order.delete_all
Purchase.delete_all
puts "Old data removed.\n\n"

# increase your seed size by changing this
# NOTE: This can make it take MUCH longer!
# A value of 10 can take over 3 minutes
MULTIPLIER = 4


srand(42)

puts "Creating States..."
7.times do
  State.create( name: Faker::Address.state)
end
puts "States created.\n\n"

puts "Creating Cities..."
states = State.all
(MULTIPLIER * 25).times do
	possible_num = rand(100)
	if possible_num < 40
		state = states[0]
	elsif possible_num < 60
		state = states[1]
	elsif possible_num < 80
		state = states[2]
	else
		possible_num = rand(4)
		state = states[possible_num + 3]
	end
  	City.create( 	name: Faker::Address.city,
  					state_id: state.id)
end
puts "Cities created.\n\n"

puts "Creating Users..."
(MULTIPLIER * 25).times do
	possible_num = rand(100)
	if possible_num < 20
		join_date = Faker::Date.between(1.month.ago, 1.day.ago)
	elsif possible_num < 36
		join_date = Faker::Date.between(2.months.ago, 1.months.ago)
	elsif possible_num < 48
		join_date = Faker::Date.between(3.months.ago, 2.months.ago)
	elsif possible_num < 60
		join_date = Faker::Date.between(4.months.ago, 3.months.ago)
	elsif possible_num < 68
		join_date = Faker::Date.between(5.months.ago, 4.months.ago)
	elsif possible_num < 76
		join_date = Faker::Date.between(6.months.ago, 5.months.ago)
	elsif possible_num < 84
		join_date = Faker::Date.between(7.months.ago, 6.months.ago)
	elsif possible_num < 88
		join_date = Faker::Date.between(8.months.ago, 7.months.ago)
	elsif possible_num < 92
		join_date = Faker::Date.between(9.months.ago, 8.months.ago)
	elsif possible_num < 96
		join_date = Faker::Date.between(10.months.ago, 9.months.ago)
	elsif possible_num < 98
		join_date = Faker::Date.between(11.months.ago, 10.months.ago)
	else
		join_date = Faker::Date.between(12.months.ago, 11.months.ago)
	end
  	User.create( 	email: Faker::Internet.email,
               		name: Faker::Name.name,
               		join_date: join_date,
               		phone_number: Faker::PhoneNumber.phone_number  )
end
puts "Users created.\n\n"

puts "Creating Addresses..."
users = User.all
(MULTIPLIER * 60).times do |index|
	user = User.all.sample
  	city = City.all.sample
  	Address.create(	state_id: city.state_id,
               		city_id: city.id,
               		zip: Faker::Address.zip,
               		street: Faker::Address.street_address,
               		billing_default: false,
               		shipping_default: false,
               		user_id: user.id)
end

User.all.each do |user|
	address = Address.find_by(user_id: user.id)
	if address
		address.update( billing_default: true )
		address.update( shipping_default: true )
	end
end
puts "Addresses created.\n\n"

puts "Creating Payments..."
(MULTIPLIER * 25).times do |index|
	users = User.all
  	Payment.create( cc_number: Faker::Number.number(16),
               		expiration_date: Faker::Date.between(1.year.from_now, 4.years.from_now),
               		code: Faker::Number.number(3),
               		user_id: users[index].id )
end
(MULTIPLIER * 40).times do
  	Payment.create( cc_number: Faker::Number.number(16),
               		expiration_date: Faker::Date.between(1.year.from_now, 4.years.from_now),
               		code: Faker::Number.number(3),
               		user_id: User.all.sample.id )
end
puts "Payments created.\n\n"

puts "Creating Categories..."
(MULTIPLIER * 2).times do
  	Category.create( description: Faker::Commerce.department)
end
puts "Categories created.\n\n"

puts "Creating Products..."
(MULTIPLIER * 25).times do
  	Product.create( title: Faker::Commerce.product_name,
               		description: Faker::Lorem.sentences(2),
               		price: Faker::Commerce.price,
               		sku: Faker::Number.unique.number(8),
               		category_id: Category.all.sample.id  )
end
puts "Products created.\n\n"

puts "Creating Orders..."
(MULTIPLIER * 30).times do
	address = Address.all.sample
	user = User.find(address.user_id)
	payments = Payment.where(:user_id => user.id)
	addresses = Address.where(:user_id => user.id)
  	Order.create( 	placed: true,
               		billing_address_id: addresses.sample.id,
               		shipping_address_id: addresses.sample.id,
               		payment_id: payments.sample.id,
               		user_id: user.id  )
end
puts "Orders created.\n\n"

puts "Creating Carts..."
(MULTIPLIER * 8).times do
	address = Address.all.sample
	user = User.find(address.user_id)
	payments = Payment.where(:user_id => user.id)
	addresses = Address.where(:user_id => user.id)
  	Order.create( 	placed: false,
               		billing_address_id: addresses.sample.id,
               		shipping_address_id: addresses.sample.id,
               		payment_id: payments.sample.id,
               		user_id: user.id  )
end
puts "Carts created.\n\n"

puts "Creating Purchases..."
placed_orders = Order.where(:placed => true)
placed_orders.each do |order|
	Purchase.create(	quantity: Faker::Number.between(1, 3),
						order_id: order.id,
						product_id: Product.all.sample.id)
end
(MULTIPLIER * 50).times do
  	Purchase.create(	quantity: Faker::Number.between(1, 3),
						order_id: Order.all.sample.id,
						product_id: Product.all.sample.id)
end
puts "Purchase created.\n\n"

puts "\n\nALL DONE!!!"
puts "It took #{Time.now - start_time} seconds."
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
srand(115101101100)
250.times do |i|
	Location.create(user_id: i/5+1,
		            address: Faker::Address.street_address,
		            city: Faker::Address.city,
		            state: Faker::Address.state,
		            country: Faker::Address.country,
		            zipcode: Faker::Address.zip.to_i)
end



50.times do |i|
	User.create(name: Faker::Name.name,
		        email: Faker::Internet.email,
		        number: Faker::PhoneNumber.phone_number,
		        cc_num: Faker::Business.credit_card_number,
			    	default_billing_address_id: Location.where(:user_id => i+1).sample.id,
			    	default_shipping_address_id: Location.where(:user_id => i+1).sample.id)
end


10.times do
	Category.create(description: Faker::Hacker.noun)
end


100.times do
	Product.create(title: Faker::Commerce.product_name,
		             description: Faker::Lorem.sentence,
		             price: rand()*20+10,
		             sku: Faker::Code.ean,
		             category_id: rand*10+1)
end

70.times do
	Order.new
	Order.user = rand*50+1
	Order.shipping_address_id = Location.where(:user_id => Order.user_id).sample.id




















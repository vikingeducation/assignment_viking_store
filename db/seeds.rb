# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
srand(115101101100)
250.times do
	Location.create(user_id: rand() * 50 + 1,
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
		    	default_billing_address_id: rand * 250 + 1,
		    	default_shipping_address_id: rand * 250 + 1)
end
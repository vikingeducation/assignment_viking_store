# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Profile.destroy_all
Product.destroy_all
Address.destroy_all

5.times do

	first = Faker::Name.first_name
	last = Faker::Name.last_name
puts "Creating user #{first} #{last}"
	Profile.create(

			:first_name => first,
			:last_name => last,
			:phone_number => Faker::PhoneNumber.phone_number

		)

	User.create(

			:email => Faker::Internet.free_email(first),
			:username => Faker::Internet.user_name(last)

		)

puts "Created email and username for #{first} #{last}"


	Address.create(

		:street => Faker::Address.street_address,
		:city => Faker::Address.city,
		:state => Faker::Address.state_abbr,
		:zip_code => Faker::Address.zip

		)

	Product.create(

		:title => Faker::Commerce.product_name,
		:description => Faker::Lorem.sentences(1),
		:sku => Faker::Number.number(25),
		:price => Faker::Number.decimal(2)

		)



end
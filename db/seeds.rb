
puts "Resetting database"
Rake::Task["db:reset"].invoke

MULTIPLIER = 1

USERS = 100 * MULTIPLIER
CITIES = 100 * MULTIPLIER
PRODUCTS = 20 * MULTIPLIER
ORDERS = 100 * MULTIPLIER
CARTS = 25 * MULTIPLIER

def create_date( n, max )

	(365 - (365 * Math.sqrt( n / max ))).days.ago

end

puts "Creating profiles and users"

USERS.times do | n |

	first = Faker::Name.first_name
	last = Faker::Name.last_name

	Profile.create(

			:first_name => first,
			:last_name => last,
			:phone_number => Faker::PhoneNumber.phone_number

		)

	User.create(

			:email => Faker::Internet.free_email(first),
			:username => Faker::Internet.user_name(last),
			:created_at => create_date( n, USERS ),
			:updated_at => create_date( n, USERS )

		)


end

puts "Creating addresses"

CITIES.times do | n |


	Address.create(

		:street => Faker::Address.street_address,
		:city => Faker::Address.city,
		:state => Faker::Address.state_abbr,
		:zip_code => Faker::Address.zip

		)

end


puts "Creating products"

PRODUCTS.times do | n |

	Product.create(

		:title => Faker::Commerce.product_name,
		:description => Faker::Lorem.sentences(1),
		:sku => Faker::Number.number(25),
		:price => Faker::Number.decimal(2)

		)

end


users = User.all

puts "Creating orders"

ORDERS.times do | n |


	Order.create(
		:user_id => users[n].id,
		:created_at => create_date( n, ORDERS ),
		:updated_at => create_date( n, ORDERS )
	)


end


orders = Order.all
products = Product.all

puts "Creating carts"

CARTS.times do | n |

	Cart.create(

		:order_id => orders[ n ].id,
		:product_id => products[ rand(19) ].id

		)


end





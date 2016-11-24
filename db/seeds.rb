
#User.destroy_all
#Profile.destroy_all
#Product.destroy_all
#Address.destroy_all
#Cart.destroy_all
#Order.destroy_all

# reset the data
Rake::Task["db:reset"].invoke

MULTIPLIER = 1

USERS = 100 * MULTIPLIER
CITIES = 100 * MULTIPLIER
PRODUCTS = 20 * MULTIPLIER
ORDERS = 100 * MULTIPLIER

def create_date( n, max )

	(365 - (365 * Math.sqrt( n.to_f / max.to_f ))).days.ago

end


USERS.times do | n |

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
			:username => Faker::Internet.user_name(last),
			:created_at => create_date( n, USERS ),
			:updated_at => create_date( n, USERS )

		)

puts "Created email and username for #{first} #{last}"

end


CITIES.times do | n |


	Address.create(

		:street => Faker::Address.street_address,
		:city => Faker::Address.city,
		:state => Faker::Address.state_abbr,
		:zip_code => Faker::Address.zip

		)

end



PRODUCTS.times do | n |

	Product.create(

		:title => Faker::Commerce.product_name,
		:description => Faker::Lorem.sentences(1),
		:sku => Faker::Number.number(25),
		:price => Faker::Number.decimal(2)

		)

end


user = User.all

ORDERS.times do | n |


	Order.create(
		:user_id => user[n].id,
		:created_at => create_date( n, ORDERS ),
		:updated_at => create_date( n, ORDERS )
	)


end




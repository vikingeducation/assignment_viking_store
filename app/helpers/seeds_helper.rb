module SeedsHelper

MULTIPLIER = 1

	def test
		puts "hello"
	end

	def date
		Faker::Time.forward(365, :all)
	end

	def zipcode_generator
		Faker::Number.number(5)
	end

	def get_status
	  ["pending", "shipped", "cancelled", "delivered"].sample
	end


	def create_user
		(100 * MULTIPLIER).times do
	     	user = User.create(
			  first_name: Faker::Name.first_name,
			  last_name: Faker::Name.last_name,
			  created_at: date)
		end
	end

	def create_products
		(20 * MULTIPLIER).times do
		  product = Product.create(
		    title: Faker::Commerce.unique.product_name,
		    description: Faker::Lorem.sentence,
		    price: Faker::Commerce.price,
		    sku_number: Faker::Number.number(10)
		    )	
	    end
	end

	def create_address(address)
		 (100 * MULTIPLIER).times do 
		  address = address.create(
			line1: Faker::Address.street_address,
			line2: Faker::Address.street_name,
			city: Faker::Address.city,
			state: Faker::Address.state,
			zipcode: Faker::Address.zip_code,)
		end
	end

	def create_orders
		100.times do
			orders = Order.create(status: get_status)
		end
	end
		
end
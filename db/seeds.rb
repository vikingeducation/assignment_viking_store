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
		    	default_billing_address_id: Location.where(:user_id => i+1).pluck(:id).sample,
		    	default_shipping_address_id: Location.where(:user_id => i+1).pluck(:id).sample)
end


10.times do
	Category.create(description: Faker::Hacker.noun)
end


100.times do
	Product.create(title: Faker::Commerce.product_name,
		             description: Faker::Lorem.sentence,
		             price: rand()*20+10,
		             sku: Faker::Code.ean,
		             category_id: Category.pluck(:id).sample)
end

70.times do
	new_order = Order.new
	rand_user_id = rand*50+1
	new_order.user_id = rand_user_id
	new_order.shipping_address_id = Location.where(
		                            :user_id => rand_user_id).pluck(:id).sample
	new_order.billing_address_id  = Location.where(
		                            :user_id => rand_user_id).pluck(:id).sample
	# We will pretend 90% of orders have been bought and the other 10% are carts.
	unless rand * 10 + 1 == 10
	new_order.checkout_date = Time.parse('2015-07-23 00:00:00') - (rand * 86400 * 365 + 1).to_i
	end
	new_order.save
end

140.times do
	rand_order_id = rand*70 + 1
	rand_product_id = rand*100+1
	rand_qty = rand*10
	OrderProduct.create(order_id: rand_order_id,
                        product_id: rand_product_id,
                        quantity: rand_qty)
end




















# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
	u = User.new
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.email = Faker::Internet.email
	u.phone = Faker::PhoneNumber.phone_number
	u.default_shipping = (100*rand).ceil
	u.default_billing = (100*rand).ceil
	u.save
end

100.times do
	cc = CreditCard.new
	cc.user_id = (100*rand).ceil
	cc.exp_date = Faker::Time.forward(2000)
	cc.credit_card_number = Faker::Business.credit_card_number
	cc.cvv_code = Faker::Number.number(3)
	cc.save
end

100.times do
	a = Address.new
	a.user_id = (100*rand).ceil
	a.first_line = Faker::Address.street_address
	a.second_line = Faker::Address.secondary_address
	a.city = Faker::Address.city
	a.state = Faker::Address.state_abbr
	a.zip = Faker::Address.zip_code
	a.save
end

50.times do |i|
	p = Product.new
	p.title = Faker::Commerce.product_name
	p.description = Faker::Company.catch_phrase if i.even?
	p.price = Faker::Commerce.price
	p.sku = Faker::Number.number(4)
	p.category_id = (5*rand).ceil
	p.save
end

# Only going to make 5 categories for this
5.times do |i|
	names = ["Clothing","Electronics","Music","Food","Transportation"]
	descriptions = ["Things that you wear","Items which consume electricity","You can listen to these musical items","EAT ME!","I get around with these transportation-related items"]
	c = Category.new
	c.name = names[i]
	c.description = descriptions[i]
	c.save
end

# OrderItem
100.times do |i|
	item_count = (5*rand).ceil
	order_id = Faker::Number.number(4)
	item_count.times do |j|
		oi = OrderItem.new
		oi.quantity = (5*rand).ceil
		oi.order_id = i + 1
		oi.product_id = (50*rand).floor
		oi.save
	end
end

# Order
100.times do |i|
	o = Order.new
	o.order_date = Faker::Time.backward(500) if i%5 == 0
	o.user_id = (100*rand).ceil if i%3 == 0
	o.save
end
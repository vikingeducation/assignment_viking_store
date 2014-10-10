# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "********Seeding Data Start************"
# DELETE IT ALL!!!!!!!

puts "********Deleting stuff************"
User.delete_all
Address.delete_all
Product.delete_all
State.delete_all
City.delete_all
Category.delete_all
Card.delete_all
OrderContent.delete_all


SEED_MULTIPLIER = 1
LOWEST_MAX = 100
seed = SEED_MULTIPLIER * LOWEST_MAX

puts "********Seeding Users************"
# USERS
seed.times do

	c = City.new
	c.name = Faker::Address.city
	c.save

	a = Address.new
	a.street = Faker::Address.street_address
	a.zip = Faker::Address.zip_code
	a.phone_number = Faker::PhoneNumber.phone_number
	a.city_id = Faker::Number.number(3)
	a.state_id = Faker::Number.number(2)
	a.user_id = Faker::Number.number(3) # I don't think this will work...
	a.save

	u = User.new # total hack to get the user ID numbr
	u.fname = Faker::Name.first_name
	u.lname = Faker::Name.last_name
	u.email = Faker::Internet.email
	u.billing_id = a.id
	u.shipping_id = a.id
	u.save

	k = Category.new # When does the ID get assigned
	k.name = Faker::Commerce.department
	k.description = Faker::Lorem.paragraph
	k.save
  
  p = Product.new
  p.name = Faker::Commerce.product_name
  p.description = Faker::Lorem.paragraph
  p.sku = Faker::Code.isbn
  p.price = Faker::Commerce.price
  p.category_id = rand(100 + 1)
  p.save

  o = Order.new
  o.user_id = u.id
  o.billing_address_id = u.billing_id
  o.shipping_address_id = u.shipping_id
  o.save

  cc = Card.new
  cc.user_id = u.id
  cc.number = Faker::Business.credit_card_number
  cc.exp_month = Faker::Number.number(2)
  cc.exp_month = Faker::Number.number(4)
  cc.ccv = Faker::Number.number(3)
  cc.save

  oc = OrderContent.new
  oc.product_id = p.id
  oc.order_id = o.id
  oc.quantity = Faker::Number.number(2)
  oc.save

end

50.times do 
	s = State.new
	s.name = Faker::Address.state
	s.save
end	



puts "********Seeding Data End************"

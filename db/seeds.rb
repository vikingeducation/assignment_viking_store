# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Category
6.times do |i|
  c = Category.new
  c.title = Faker::Commerce.department(1)
  c.description = Faker::Lorem.paragraph

  c.save
end


# Product
def create_product
  p = Product.new
  p.title = Faker::Commerce.product_name
  p.price = Faker::Commerce.price
  p.description = Faker::Lorem.paragraph
  p.sku = Faker::Number.number(10)
  p.category_id = Category.all.sample.id

  p.save
end
20.times do |i|
  create_product
end

# Orders

def create_users
  u = User.new
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name 
  u.email = Faker::Internet.email
  u.phone_number = Faker::PhoneNumber.phone_number
  a = create_address
  u.default_shipping_address_id = u.default_billing_address_id = a.id
  p.save
end

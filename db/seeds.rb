# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


15.times do 
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
end


15.times do 
  Address.create(street: Faker::Address.street_name, city: Faker::Address.city, state: Faker::Address.state, country: Faker.Address.country, default: false)
end

15.times do 
  Category.create(name: Faker::Commerce.department, description: Faker::Company.buzzword)
end


users = User.select('id').to_a

15.times do 
  CreditCard.create(number: Faker::Business.credit_card_number, user_id: users.sample.id)
end

addresses = Address.select('id').to_a


15.times do 
  Order.create(user_id: users.sample.id, shipping_address_id: addresses.sample.id, billing_address_id: addresses.sample.id)
end


15.times do 
  PhoneNumber.create(number: Faker::PhoneNumber.phone_number)
end

categories = Category.select('id').to_a

15.times do 
  Product.create(name: Faker::Commerce.product_name, description: Faker::Company.buzzword, price: Faker::Number.decimal(2).to_f, sku: Faker::Code.ean, category_id: categories.sample.id )

end

products = Product.select('id').to_a
orders = Order.select('id').to_a

15.times do 
  ProductOrder.create(product_id: products.sample.id, order_id: orders.sample.id)
end

15.times do 
  Shipment.create(address: addresses.sample.id)
end


15.times do 
  UserAddress.create(user_id: user.sample.id, address_id: addresses.sample.id)
end

phone_numbers = PhoneNumber.select('id').to_a

15.times do 
  UserPhoneNumber.create(user_id: users.sample.id, phone_number_id: phone_numbers.sample.id)
end



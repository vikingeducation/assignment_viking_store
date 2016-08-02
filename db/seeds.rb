# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email)
end

3.times do
  Category.create!(name: Faker::Commerce.department,
                   description: Faker::Lorem.sentence)
end

3.times do
  random_category = Category.all.sample.id
  Product.create!(title: Faker::Commerce.product_name,
                  description: Faker::Lorem.sentence,
                  category_id: random_category,
                  price: Faker::Commerce.price.to_i,
                  sku: Faker::Code.isbn)
end

3.times do
  Address.create!(street_number: rand(1000),
                  street_name: Faker::Address.street_name,
                  city: Faker::Address.city,
                  state: Faker::Address.state,
                  country: Faker::Address.country)
end

3.times do
  random_user = User.all.sample.id
  random_product = Product.all.sample.id
  Cart.create!(user_id: random_user,
               product_id: random_product,
               quantity: rand(7),
               checked_out: [true,false].sample,
               )
end

3.times do
  random_user = User.all.sample.id
  random_ship_address = Address.all.sample.id
  random_bill_address = Address.all.sample.id
  Customer.create!(user_id: random_user,
                   shipping_address_id: random_ship_address, 
                   billing_address_id: random_bill_address,
                   credit_card: Faker::Business.credit_card_number,
                   phone_number: Faker::PhoneNumber.phone_number,
                  )
end


3.times do 
  random_user = User.all.sample.id
  items_purchased = Cart.find_by_sql(
                    "SELECT product_id, quantity
                    FROM carts
                    WHERE user_id = #{random_user}
                    ")
  customer = Customer.find_by(:user_id => random_user)
  Order.create!(customer_id: customer.id
                delivered_at: Faker::Time.forward(rand(7))
                    


    )









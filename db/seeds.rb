# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email)
end

5.times do
  Category.create!(name: Faker::Commerce.department,
                   description: Faker::Lorem.sentence)
end

20.times do
  random_category = Category.all.sample.id
  Product.create!(title: Faker::Commerce.product_name,
                  description: Faker::Lorem.sentence,
                  category_id: random_category,
                  price: Faker::Commerce.price.to_i,
                  sku: Faker::Code.isbn)
end

20.times do
  random_user = User.all.sample.id
  Address.create!(street_number: rand(1000),
                  street_name: Faker::Address.street_name,
                  city: Faker::Address.city,
                  state: Faker::Address.state,
                  country: Faker::Address.country,
                  user_id: random_user)
end

20.times do
  random_user = User.all.sample.id
  random_product = Product.all.sample.id
  Cart.create!(user_id: random_user,
               product_id: random_product,
               quantity: rand(7),
               )
end


# 3.times do
#   random_user = User.all.sample.id
#   random_ship_address = Address.where("user_id = ?", random_user).first.id
#   random_bill_address = Address.where("user_id = ?", random_user).first.id
#   Customer.create!(user_id: random_user,
#                    shipping_address_id: random_ship_address, 
#                    billing_address_id: random_bill_address,
#                    credit_card: Faker::Business.credit_card_number,
#                    phone_number: Faker::PhoneNumber.phone_number,
#                   )
# end


4.times do 
  random_user = User.all.sample.id
  # Ensure that there is a customer with a proper address.
  unless Customer.where("customers.user_id = ?", random_user).any?
    random_ship_address = Address.where("user_id = ?", random_user).first.id
    random_bill_address = Address.where("user_id = ?", random_user).first.id
    Customer.create!(user_id: random_user,
                     shipping_address_id: random_ship_address, 
                     billing_address_id: random_bill_address,
                     credit_card: Faker::Business.credit_card_number,
                     phone_number: Faker::PhoneNumber.phone_number,
                    )
  end
  random_cart = Cart.where("carts.user_id = ? AND checked_out = ?", random_user, "false")
  if random_cart.any?
    new_order = Order.create!(delivered_at: Faker::Time.forward(rand(7)+1),
                              scheduled_delivery: Faker::Time.forward(3))
    random_cart.each do |cart|
      cart.update(checked_out: true, order_id: new_order.id)
    end
  end
end



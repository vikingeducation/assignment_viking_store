# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Faker::Config.locale = 'en-US'

SCHWAD = 5

SCHWAD.times do 
  Category.create(
    name: Faker::Commerce.department,
    description: Faker::Lorem.paragraph,
    )
end

(SCHWAD*5).times do 
 User.create(
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone: Faker::PhoneNumber.phone_number,
  shipping_address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr} #{Faker::Address.zip_code}",
  billing_address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr} #{Faker::Address.zip_code}",
  payment_card: Faker::Business.credit_card_number
  )
end

(SCHWAD*15).times do
  current_category = Category.all.sample
  Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    category_id: current_category.id     
    )
end

(SCHWAD*8).times do
OrderProduct.create(
  product_id: Product.all.sample.id,
  customer_id: User.all.sample.id,
  quantity: (1..5).to_a.sample
  )
end

OrderProduct.all.each do |order| 
  ShoppingCart.create(
    quantity: order.quantity,
    item: Product.select("title").where("id = ?", order.product_id),
    customer: User.select("first_name").where("id = ?", order.customer_id),
    #multiplying by grandtotal nor working
    grand_total: order.quantity * Product.select("price").where("id = ?", order.product_id).map{|p| p.price}[0],
    item_total_cost: order.quantity * Product.select("price").where("id = ?", order.product_id).map{|p| p.price}[0],  
    checked_out: [true,false].sample  
    )
end

ShoppingCart.where("checked_out = ?", true).each do |order|
  Order.create(
    quantity: order.quantity,
    item: order.item,
    customer: order.customer,
    grand_total: order.grand_total,
    item_total_cost: order.item_total_cost
    )  

end

User.all.each do |user|
  Address.create(
    user_id: user.id,
    priority: 1,
    shipping_address: user.shipping_address,
    billing_address: user.billing_address
    )
end  


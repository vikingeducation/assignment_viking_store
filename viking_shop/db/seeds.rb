# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cart.delete_all
Product.delete_all
User.delete_all
Address.delete_all
Order.delete_all
Payment.delete_all
Catagory.delete_all



CITY_DB = Array.new(100){Faker::Address.city}
STATE_DB = Array.new(10){Faker::Address.state}


def create_user
  User.create(
    username:  Faker::Lorem.word,
    email: Faker::Internet.free_email,
    phone: Faker::PhoneNumber.cell_phone,
    ship_add: Address.pluck(:id).sample,
    bill_add: Address.pluck(:id).sample,
    sub_add: Address.pluck(:id).sample
    )

end

def create_address
    Address.create(
        first_add: Faker::Address.street_address,
        second_add: Faker::Address.secondary_address,
        city: CITY_DB.sample,
        state: STATE_DB.sample
      )

end

def create_payment
  Payment.create(
    user_id:  User.pluck(:id).sample,
    card_num: Faker::Business.credit_card_number,
    card_type: Faker::Business.credit_card_type
    )

end

def create_cata
    Catagory.create(
        description: Faker::Lorem.paragraph
      )

end

def create_product
    Product.create(
      title: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price,
      SKU: Faker::Company.ein,
      catalog: Catagory.pluck(:id).sample
    )

end

def create_order
  offset = rand(User.count)
  rUser = User.offset(offset).first
  Order.create(
    user_name: rUser.username,
    bill_add: rUser.bill_add,
    ship_add: rUser.ship_add,
    price: Faker::Commerce.price
    )

end

def create_carts
  offset = rand(User.count)
  rUser = User.offset(offset).first
  Cart.create(
   price: Faker::Commerce.price,
   buyer_id: rUser.id
    )

end

300.times do
  create_address#create one address database
end

100.times do
    create_user#create users for 100 times.
end

200.times do
  create_payment
end

5.times do
  create_cata
end

20.times do
  create_product
end

100.times do
  create_order
end

50.times do
  create_carts
end

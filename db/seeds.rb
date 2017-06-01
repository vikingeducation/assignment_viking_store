# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  User.create(
    email: Faker::Internet.unique.email,
    fname: Faker::Name.first_name,
    lname: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    created_at: Faker::Time.backward(300, :evening),
    updated_at: Faker::Time.backward(300, :evening)
  )
end
100.times do
  Ship_add.create(
    user_id: Faker::Number.between(1, 100),
    default: Faker::Boolean.boolean,
    add_num: Faker::Address.building_number,
    street: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    country: Faker::Address.country,
    created_at: Faker::Time.backward(300, :evening),
    updated_at: Faker::Time.backward(300, :evening)
  )
end
100.times do
  Bill_add.create(
    user_id: Faker::Number.between(1, 100),
    default: Faker::Boolean.boolean,
    add_num: Faker::Address.building_number,
    street: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    country: Faker::Address.country,
    created_at: Faker::Time.backward(300, :evening),
    updated_at: Faker::Time.backward(300, :evening)
  )
end
100.times do
  Product.create(
    category_id: Faker::Number.between(1, 6),
    title: Faker::Commerce.product_name,
    description: Faker::Hipster.sentences,
    price: Faker::Commerce.price,
    sku: Faker::Number.number(10),
    created_at: Faker::Time.backward(300, :evening),
    updated_at: Faker::Time.backward(300, :evening)
  )
end
6.times do
  Category.create(
    name: Faker::Commerce.department,
    description: Faker::Hipster.sentences,
    created_at: Faker::Time.backward(300, :evening),
    updated_at: Faker::Time.backward(300, :evening)
  )
end
100.times do
  Order.create(
    user_id: Faker::Number.between(1, 99),
    quantity: Faker::Number.between(1, 10),
    created_at: Faker::Time.backward(300, :evening),
    updated_at: Faker::Time.backward(300, :evening)
  )
end
100.times do
  Cart.create(
    order_id: Faker::Number.between(1, 100),
    created_at: Faker::Time.backward(300, :evening),
    updated_at: Faker::Time.backward(300, :evening)
  )
end
5.times do
  Order_status.create(
    code: Faker::Number.between(1, 100),
    name: Faker::StarWars.vehicle,
    created_at: Faker::Time.backward(300, :evening),
    updated_at: Faker::Time.backward(300, :evening)
  )
end

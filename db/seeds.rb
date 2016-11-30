# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create({ name: 'Star Wars' }, { name: 'Lord of the Rings' })
#   Character.create(name: 'Luke', movie: movies.first)

def email_generator(first, last)
  "#{first}.#{last}@#{Faker::Hipster.words(1)[0]}.#{Faker::Hipster.words(1)[0]}"
end

record_count = 5

record_count.times do
  u = User.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: 'placeholder',
    phone_number: Faker::PhoneNumber.phone_number
  })

  u.update(email: email_generator(u.first_name, u.last_name))

  a = Address.create({
    street: Faker::Address.street_address,
    zip: Faker::Address.zip,
    address_type: 'shipping',
    primary: false,
    users_id: u.id,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country
  })

  c = Category.create({
    name: Faker::Hipster.words(1)[0]
  })

  pro = Product.create({
    title: Faker::Commerce.product_name,
    description: Faker::Hipster.paragraph,
    price: Faker::Commerce.price,
    sku: Faker::Code.asin,
    categories_id: c.id
  })

  o = Order.create({
    date: Faker::Date.backward(14),
    open: true,
    users_id: u.id
  })

  l = LineItem.create({
    quantity: rand(10),
    sale_price: Faker::Commerce.price,
    products_id: pro.id,
    orders_id: o.id
  })
end

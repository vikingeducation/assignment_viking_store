User.destroy_all
Address.destroy_all
Category.destroy_all
Product.destroy_all
Order.destroy_all
OrderItem.destroy_all
ShoppingCart.destroy_all
ShoppingCartItem.destroy_all

MULTIPLIER = 1

cities = []
states = []

(30 * MULTIPLIER).times do
  cities << Faker::Address.city
end

(5 * MULTIPLIER).times do
  states << Faker::Address.state
end

locations = Hash.new { |h,k| h[k] = [] }

cities.each do |city|
  locations[states.sample] << city
end

def create_addresses_for_user(user, locations)
  state = locations.keys.sample

  rand(1..5).times do
    user.addresses.create(
      line_1: Faker::Address.street_address,
      city: locations[state].sample,
      region: state,
      country: "United States",
      zip_code: Faker::Address.zip_code
    )
  end

  user.shipping_address = user.addresses.sample
  user.billing_address = user.addresses.sample
  user.save
end

# create Categories
(6 * MULTIPLIER).times do
  Category.create(name: Faker::Commerce.department, description: Faker::Hipster.paragraph(2))
end

(30 * MULTIPLIER).times do
  Product.create(name: Faker::Commerce.product_name, description: Faker::Hipster.sentence, price: Faker::Commerce.price, category: Category.all.sample, sku: Faker::Number.hexadecimal(8))
end

# create users
day = Date.today - 100
amount = 1

until User.all.count >= (100 * MULTIPLIER)
  first_name = Faker::Name.first_name

  amount.times do
    new_user = User.create(
      first_name: first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email(first_name),
      phone_number: Faker::PhoneNumber.phone_number,
      created_at: day
    )

    create_addresses_for_user(new_user, locations)

    user = User.all.sample

    order = Order.create(
      user: user,
      shipping_address: user.shipping_address,
      billing_address: user.billing_address,
      created_at: day
    )

    rand(1..5).times do
      order.order_items.create(product: Product.all.sample, quantity: rand(1..5))
    end

    order.save
  end

  day += 1
  amount += 1
end

random_users = []
until random_users.size == (25 * MULTIPLIER)
  random_users << User.all.sample
  random_users.uniq!
end

random_users.each do |user|
  cart = ShoppingCart.create(
    user: user
  )

  rand(1..5).times do
    cart.shopping_cart_items.create(product: Product.all.sample, quantity: rand(1..5))
  end

  cart.save
end

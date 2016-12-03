# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#generate coutnries and states, DONE
#generate categroies 10, DONE
#generate products 25 DONE
#generate user
  #for each user generate 1-4 addresses
  #associate addresses and users together

#loop this x times
  #generate shopping carts for random users
    #for each cart, associate an user
    #for each cart associate an address from that user for each billing and shipping
  #mark all shopping carts as complete
#end loop

#generate filled carts for random users, following above loop process, minus marking as complete

SEED_VALUE = ENV['seed'].to_i
SEED_VALUE = 1 if SEED_VALUE == 0

us_states = [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
State.destroy_all
puts "Destroyed all states"
Country.destroy_all
puts "Destroyed all countries"
Category.destroy_all
puts "Destroyed all categories"
Product.destroy_all
puts "Destroyed all products"
User.destroy_all
puts "Destroyed all users"
Address.destroy_all
puts "Destroyed all addresses"
ShoppingCart.destroy_all
puts "Destroyed all orders"
ProdToCart.destroy_all
puts "Destroyed product/cart relationship"

us_states.each do |place|
  State.create!(state: place[0])
end
puts "generated us states!"

Country.create!(country: "USA")
Country.create!(country: "Canada")
Country.create!(country: "New Zwanziand")
puts "generated sample countries"


100.times do
 City.create!(
    state_id: Faker::Number.between(State.first.id, State.last.id),
    name: Faker::Address.city
    )
end
puts "generated 100 cities"

6.times do
  Category.create!(tag: Faker::Company.buzzword)
end
puts "generated 6 categories"

30.times do
  Product.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(2, true),
    price: Faker::Commerce.price,
    sku: Faker::Code.asin,
    category_id: Faker::Number.between(Category.first.id, Category.last.id)
    )
end

puts "generated 30 products"

def create_address(user_id = nil)
  city_id = Faker::Number.between(City.first.id+10, City.last.id-10)
  city_id = City.first.id if Faker::Number.between(1,4) == 4
  city = City.find(city_id)
  address = Address.create!(
              street: Faker::Address.street_address,
              city: city_id,
              state_id: city.state_id,
              country_id: Faker::Number.between(Country.first.id, Country.last.id),
              user_id: user_id,
              zip: Faker::Address.zip_code
              )
  address.id
end

def create_user(address_id, billing_id)
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    credit_card: Faker::Business.credit_card_number,
    shipping_address_id: address_id,
    billing_address_id: billing_id,
    created_at: join_date
  )
  Address.find(address_id).update_attribute(:user_id, user.id)
  Address.find(billing_id).update_attribute(:user_id, user.id)
end

def join_date
  join_date = Faker::Time.between(1.years.ago, Date.today)
  join_date = Faker::Time.between(6.months.ago, Date.today) if Faker::Number.between(1,3) == 3
  join_date = Faker::Time.between(3.months.ago, Date.today) if Faker::Number.between(1,3) == 3
end

(SEED_VALUE*150).times do
  create_user(create_address, create_address)
end
puts "created #{(SEED_VALUE*150)} users and their addresses"

(SEED_VALUE*60).times do
  address = create_address(Faker::Number.between(User.first.id, User.last.id))
end
puts "created #{(SEED_VALUE*60)} random addresses and assigned them to users"


def generate_cart(user_id)
  user = User.find(user_id)
  cart = ShoppingCart.create!(
    user_id: user_id,
    shipping_address_id: user.shipping_address_id,
    billing_address_id: user.billing_address_id,
    checked_out: false,
    created_at: cart_date(user)
    )

  rand(1..8).times do
    ProdToCart.create(
      amount: Faker::Number.between(1, 10),
      shopping_cart_id: cart.id,
      product_id: Faker::Number.between(Product.first.id, Product.last.id)
      )
  end
  cart.id
end

def cart_date(user)
  Faker::Time.between(user.created_at, Date.today)
end

(SEED_VALUE*250).times do
  cart = generate_cart(user_id = Faker::Number.between(User.first.id, User.last.id))
  ShoppingCart.find(cart).update_attribute(:checked_out, true)
end

puts "Order history generated, #{(SEED_VALUE*250)} orders, each containing up to 8 items!"
  
(SEED_VALUE*25).times do
  cart = nil
  until cart
    user_id = Faker::Number.between(User.first.id, User.last.id)
    unless ShoppingCart.where(user_id: user_id).exists?( checked_out: false)
      cart = generate_cart(user_id: user_id)
    end
  end
 
end

puts "Open carts generated,#{(SEED_VALUE*25)}"

# cluster join dates more to the present

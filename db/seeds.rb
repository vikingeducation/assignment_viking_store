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

us_states.each do |place|
  State.create!(state: place[0])
end
puts "generated us states!"

Country.create!(country: "USA")
Country.create!(country: "Canada")
Country.create!(country: "New Zwanziand")
puts "generated sample countries"


10.times do
  Category.create!(tag: Faker::Company.buzzword)
end
puts "generated 10 categories"

25.times do
  Product.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(2, true),
    price: Faker::Commerce.price,
    sku: Faker::Code.asin,
    category_id: Faker::Number.between(Category.first.id, Category.last.id)
    )
end

puts "generated 25 products"

def create_address()
  address = Address.create!(
              street: Faker::Address.street_address,
              city: Faker::Address.city,
              state_id: Faker::Number.between(State.first.id, State.last.id),
              country_id: Faker::Number.between(Country.first.id, Country.last.id)
              )
  address.id
end

def create_user(address_id, billing_id)
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    phone_number: Faker::PhoneNumber.phone_number,
    credit_card: Faker::Business.credit_card_number,
    shipping_address_id: address_id,
    billing_address_id: billing_id
  )
  Address.find(address_id).update_attribute(:user_id, user.id)
  Address.find(billing_id).update_attribute(:user_id, user.id)
end


10.times do
  create_user(create_address, create_address)
end

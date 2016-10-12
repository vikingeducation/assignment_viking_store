puts "Starting seeds...\n\n"
start_time = Time.now

puts "Removing old data..."
# Blow away the existing data
Address.delete_all
Category.delete_all
City.delete_all
Country.delete_all
Order.delete_all
OrderItem.delete_all
Product.delete_all
State.delete_all
User.delete_all
ZipCode.delete_all
puts "Old data removed.\n\n"

# increase your seed size by changing this
# NOTE: This can make it take MUCH longer!
# A value of 10 can take over 3 minutes
MULTIPLIER = 50


puts "Creating countries..."
Country.create(name: 'USA')
puts "Countries created.\n\n"


puts "Creating States..."
5.times do |state_name|
  State.create( name: Faker::Address.state,
                country_id: Country.pluck(:id).sample)
end
puts "States created.\n\n"


puts "Creating Cities..."
State.all.each do |state|
  MULTIPLIER.times do
    City.create( name: Faker::Address.city,
                 state_id: state.id )
  end
end
puts "Cities created.\n\n"


puts "Creating Zip codes..."
State.all.each do |state|
  MULTIPLIER.times do
    ZipCode.create(code: Faker::Address.zip_code)
  end
end
puts "Zip Codes created.\n\n"

puts "Creating users..."
(MULTIPLIER * 2).times do
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  User.create(first_name: fname,
              last_name: lname,
              email: Faker::Internet.email("#{fname}"))
end
puts "Users created.\n\n"

puts "Creating Address..."
(MULTIPLIER * 2).times do
  Address.create(address: Faker::Address.street_address,
                 city: City.pluck(:name).sample,
                 state: State.pluck(:name).sample,
                 zip_code: ZipCode.pluck(:id).sample,
                 user_id: User.pluck(:id).sample)
end
puts "Adresses created.\n\n"

puts "Creating Categories..."
MULTIPLIER.times do
  Category.create(name: Faker::Beer.style)
end
puts "Categories created.\n\n"

puts "Creating Products..."
(MULTIPLIER * 10).times do
  Product.create(name: Faker::Commerce.product_name,
                 description: Faker::ChuckNorris.fact,
                 category_id: Category.pluck(:id).sample,
                 units: rand(20),
                 sku: Faker::Number.number(4),
                 price: Faker::Commerce.price)
end
puts "Products created.\n\n"

puts "Creating Orders..."
(MULTIPLIER * 2).times do
  Order.create(order_date: Faker::Date.between(1.year.ago, Date.today),
               user_id: User.pluck(:id).sample,
               billing_id: Address.pluck(:id).sample,
               shipping_id: Address.pluck(:id).sample,
               phone: Faker::PhoneNumber.phone_number,
               card_num: Faker::Business.credit_card_number)
end
puts "Orders created.\n\n"

puts "Creating OrderItem..."
Order.all.each do |order|
  2.times do
    OrderItem.create(order_id: order.id,
                     product_id: Product.pluck(:id).sample,
                     quantity: rand(3) + 1)
  end
end
puts "OrderItem created.\n\n"

puts "\n\nAll Done!!"
puts "It took #{Time.now - start_time} seconds."
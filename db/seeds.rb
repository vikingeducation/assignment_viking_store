# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


MULTIPLIER = 4

puts "Deleting the Data..."

User.delete_all
State.delete_all
ShoppingCart.delete_all
Product.delete_all
CreditCard.delete_all
Country.delete_all
City.delete_all
Category.delete_all
Address.delete_all
Billing.delete_all
Order.delete_all

puts "Data Deleted"

one_month = Faker::Time.between(Time.now, 1.months.ago)
two_months = Faker::Time.between(1.months.ago, 2.months.ago)
three_months = Faker::Time.between(2.months.ago, 3.months.ago)
four_months = Faker::Time.between(3.months.ago, 4.months.ago)
five_months = Faker::Time.between(4.months.ago, 5.months.ago)
six_months = Faker::Time.between(5.months.ago, 6.months.ago)
seven_months = Faker::Time.between(6.months.ago, 7.months.ago)
eight_months = Faker::Time.between(7.months.ago, 8.months.ago)
nine_months = Faker::Time.between(8.months.ago, 9.months.ago)
ten_months = Faker::Time.between(9.months.ago, 10.months.ago)
eleven_months = Faker::Time.between(10.months.ago, 11.months.ago)
twelve_months = Faker::Time.between(11.months.ago, 12.months.ago)

puts "Creating the Data..."

def create_user
  User.create(email: Faker::Internet.email, 
                        first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                        created_at: Faker::Time.between(Time.now, 12.months.ago) )
end

def create_address(user)
  Address.create( user_id: user.id,
                  street_nb: Faker::Address.building_number,
                  street: Faker::Address.street_name,
                  city_id: rand(1..100),
                  state_id: rand(1..10),
                  zip_code: Faker::Address.zip_code,
                  country_id: rand(0..5) )
end


def create_credit_card(user)
  CreditCard.create( user_id: user.id,
                     number: Faker::Business.credit_card_number,
                     type: Faker::Business.credit_card_type,
                     exp: Faker::Business.credit_card_expiry_date,
                     security: rand(100..999) )
end

def create_product
  Product.create( title: Faker::Commerce.product_name,
                  description: Faker::Lorem.sentence,
                  price: Faker::Commerce.price,
                  sku: rand(10000000..90000000),
                  category_id: rand(1..4),
                  created_at: Faker::Date.between(2.years.ago, 1.year.ago))
end

def create_order(user)
  Order.create( user_id: user.id,
                created_at: Faker::Date.between(1.year.ago, Date.today) )
end

def create_shopping_cart(order)
  ShoppingCart.create( order_id: order.id,
                       product_id: rand(1..20),
                       quantity: rand(1..10),
                       created_at: Faker::Date.between(1.year.ago, Date.today) )
end


def create_billing(user, order)
  Billing.create( user_id: user.id,
                  address_id: Address.where("user_id = #{user.id}"),
                  credit_card_id: CreditCard.where("user_id = #{user.id}"),
                  created_at: order.check_out )
end

# Cities

30.times {City.create(name: Faker::Address.city)}

# States

10.times {State.create(name: Faker::Address.state)}

# Countries

5.times {Country.create(name: Faker::Address.country)}

# Categories

5.times {Category.create(description: Faker::Commerce.department)}

# Create Users

100.times do
  create_user
end

# Create Products

20.times do
  create_product
end

# Create Orders And Shopping Cart

(MULTIPLIER * 10).times do
  user = User.all.sample
  o = create_order(user)
  rand(1..3).times do
    create_shopping_cart(o)
  end

  if rand(0..10) < 4
    o.update(check_out: Faker::Date.between(8.months.ago, 1.month.ago))
    rand(1..3).times do
      create_address(user)
    end

    b = create_billing(user, o)
    o.update(billing_id: b.id)
  end

end
































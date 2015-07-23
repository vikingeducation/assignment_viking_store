# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

MULTIPLIER=20

def generate_word (str)
  letters = Array("A".."z")
  result = str
  6.times{ result += letters.sample }
  result
end

#Generate users
 MULTIPLIER.times do 
  User.create(first_name:  Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: "#{rand(0..9)}#{Faker::Name.last_name}")
            end


#Generate Addresses

30.times do
    Address.create(ap: rand(1..999),
                  bld: Faker::Address.building_number,
                  street: Faker::Address.street_name,
                  city: Faker::Address.city ,
                  state: Faker::Address.state,
                  country: "United States",
                  zip: Faker::Address.zip)
  end

#Generate Billing
15.times do 
    Billing.create( creditcard: Faker::Business.credit_card_number,
                    first_name:  Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    exp: Faker::Business.credit_card_expiry_date,
                    "CVC" => "#{rand(0..999)}",
                    type: Faker::Business.credit_card_type
              )
  end

#Generate Categories
20.times do
  Category.create(name: Faker::Commerce.department)
end

#Generate Products
def get_unique_sku
  results = []
  while resuts >= 50
    new_code = Faker::Code.ean
    results << new_code unless results.include?(new_code)
  end
  results
end

sku_array = get_unique_sku

50.times do |i|
  Product.create( title: Faker::Commerce.product_name,
                  price: Faker::Commerce.price,
                  sku: sku_array[i],
                  category_id: rand(1..20),
                  amount_in_stock: rand(0..999),
    )
end

# Generate orders
10.times do 
  Order.create(billing_id: rand(1..15),
                buyer_id: rand(1..20),
                shipping_address_id: rand(1..30)             
    )

end

# Generate products_orders and Generate User_billings
10.times do
  num=rand(1..10)
  rand(1..5).times do
    Product_order.create( order_id: num,
                          product_id: rand(1..50),
                          product_quantity: rand(1..3),
      )
  end
  User_billing.create(buyer_id: Order.find(num).buyer_id,
                      billing_id: rand(1..15)
                      )
end


# Generate Shipments
20.times do
  order = Order.find(rand(1...30))
  user.default_shipping_address = rand(1...30)
  Shipment.create(user_id: order.buyer_id,
                  shipment_address_id: user.default_shipping_address,
                  pack_date: order.created_at
                  )
end



















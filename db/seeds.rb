# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

MULTIPLIER = 20


#Generate users
 MULTIPLIER.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(first_name:  first_name,
              last_name: last_name,
              email: "#{first_name}#{last_name}@domain.com",
              password: "#{rand(0..9)}#{last_name}")
            end


#Generate Addresses

((MULTIPLIER / 0.8).to_i).times do
    Address.create(ap: rand(1..999),
                  bld: Faker::Address.building_number,
                  street: Faker::Address.street_name,
                  city: Faker::Address.city ,
                  state: Faker::Address.state,
                  country: "United States",
                  zip: Faker::Address.zip)
  end

#Generate Billing
((MULTIPLIER / 0.8).to_i).times do
    Billing.create( creditcard: Faker::Business.credit_card_number,
                    first_name:  Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    exp: Faker::Business.credit_card_expiry_date,
                    "CVC" => "#{rand(101..999)}",
                    card_issuer: Faker::Business.credit_card_type
              )
  end

#Generate Categories
20.times do
  Category.create(name: Faker::Commerce.department)
end

#Generate Products
def get_unique_sku
  results = []
  until results.length >= 50
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

# Generate orders and shipments
10.times do
  current_order = Order.create(billing_id: rand(1..15),
                buyer_id: rand(1..20),
                shipping_address_id: rand(1..30),
                created_at: 
    )

  user = User.find(current_order.buyer_id)
  user.default_shipping_address = current_order.shipping_address_id
  user.save
  Shipment.create(user_id: current_order.buyer_id,
                  shipment_address_id: user.default_shipping_address,
                  pack_date: current_order.created_at + 86400
                  )

end

# Generate products_orders and Generate User_billings
10.times do
  num=rand(1..10)
  rand(1..5).times do
    ProductOrder.create( order_id: num,
                          product_id: rand(1..50),
                          product_quantity: rand(1..3)
      )
  end
  UserBilling.create(buyer_id: Order.find(num).buyer_id,
                      billing_id: rand(1..15)
                      )
end








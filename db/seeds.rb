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
              password: "#{rand(0,9)}#{last_name}")
            end


#Generate Addresses

30.times do
    Address.create(ap: rand(1,999),
                  bld: Faker::Address.building_number,
                  street: Faker::Address.street_name,
                  city: Faker::Address.city ,
                  state: Faker::Address.state,
                  country: "United States",
                  zip: Faker::Address.zip)
  end

#Generate Billing
15.times do 
    Billings.create(creditcard: Faker::Business.credit_card_number,
                    first_name:  Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    exp: Faker::Business.credit_card_expiry_date,
                    cvc: "#{rand(0,9)}#{rand(0,9)}#{rand(0,9)}",
                    type: Faker::Business.credit_card_type,

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
                  category_id: rand(20),
                  amount_in_stock: rand(0..999),
    )


# Generate orders


# Generate Shipments
# 20.times do
#   user = User.find(rand(0...30))
#   user.default_shipping_address = rand(0...30)
#   Shipment.create(user_id: user.id,
#                   shipment_address_id: user.default_shipping_address,
#                   pack_date: user.created_at,
#     )
#












# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker

100.times do |n|

  Customer.create(:email => Internet.email,
                  :first_name => Name.first_name,
                  :last_name => Name.last_name
                 )

  Order.create(:customer_id => (n+1),
               :s_a_first_line => Address.street_address,
               :s_a_city => Address.city,
               :s_a_state => Address.state,
               :s_a_zip => Address.zip,
               :b_a_first_line => Address.street_address,
               :b_a_city => Address.city,
               :b_a_state => Address.state,
               :b_a_zip => Address.zip,
               :phone => PhoneNumber.cell_phone,
               :credit_card => Business.credit_card_number
              )

  ShippingAddress.create(:customer_id => (n+1),
                         :first_line => Address.street_address,
                         :city_id => rand(1..100),
                         :state_id => rand(1..100),
                         :zip => Address.zip,
                         :default => false
                        )

  BillingAddress.create(:customer_id => (n+1),
                         :first_line => Address.street_address,
                         :city_id => rand(1..100),
                         :state_id => rand(1..100),
                         :zip => Address.zip,
                         :default => false
                        )

  Product.create(:title => Commerce.product_name,
                 :description => Lorem.paragraph,
                 :price => Commerce.price,
                 :sku => Code.isbn,
                 :group_id => (n+1)
                )

  Group.create(:name => Commerce.department(1)
              )

end

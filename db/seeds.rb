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
 # MULTIPLIER.times do 
 #  User.create(first_name:  Faker::Name.name.split(" ")[0]
 #              last_name: Faker::Name.name.split(" ")[1]
 #              email: Faker::Internet.email,
 #              password: "#{rand(0,9)}#{last_name}")
 #            end


#Generate Addresses

# 30.times do
#     Address.create(ap: rand(1,999),
#                   bld: Faker::Address.building_number,
#                   street: Faker::Address.street_name,
#                   city: Faker::Address.city ,
#                   state: Faker::Address.state,
#                   country: "United States",
#                   zip: Faker::Address.zip)
#   end

#   15.times do 
    
#     Billings.create(creditcard: Faker::Business.credit_card_number,
#                     first_name: Faker::Name.name.split(" ")[0],
#                     last_name: Faker::Name.name.split(" ")[1],
#                     exp: Faker::Business.credit_card_expiry_date,
#                     cvc: "#{rand(0,9)}#{rand(0,9)}#{rand(0,9)}",
#                     type: Faker::Business.credit_card_type,

#               )
#   end
#
#
#
#


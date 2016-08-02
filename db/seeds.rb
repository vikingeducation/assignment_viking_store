# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


f_address  = Faker::Address
f_internet = Faker::Internet
f_name     = Faker::Name
f_phone_number = Faker::PhoneNumber
f_business = Faker::Business

## Create some users

100.times do
  User.create({
                email: f_internet.email,
                first_name: f_name.first_name,
                last_name: f_name.last_name,
                phone_num: f_phone_number.phone_number
                })
end

## Create some creditcards

75.times do
  users = User.order("RANDOM()")
  rand_user_id = users.pop.id
  CreditCard.create({
                      user_id: rand_user_id,
                      cc_number: f_business.credit_card_number
                    })
end


## Create some addresses

def get_rand_user_for_addr
  begin
    rand_user = User.order("RANDOM()").first
  end while rand_user.ship_addr_id && rand_user.bill_addr_id
  rand_user
end

75.times do
  Address.create({
                   user_id: get_rand_user_for_addr.id,
                   


                   })

end

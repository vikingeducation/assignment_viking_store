# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SEED_MULTIPLIER = 2

# Category
(SEED_MULTIPLIER*6).times do |i|
  c = Category.new
  c.title = Faker::Commerce.department(1)
  c.description = Faker::Lorem.paragraph

  c.save
end


# Product
def create_product
  p = Product.new
  p.title = Faker::Commerce.product_name
  p.price = Faker::Commerce.price
  p.description = Faker::Lorem.paragraph
  p.sku = Faker::Number.number(10)
  p.category_id = Category.all.sample.id

  p.save
end
(SEED_MULTIPLIER*20).times do |i|
  create_product
end

# Orders

def create_address
  a = Address.new
  a.street_address = Faker::Address.street_address
  a.city = Faker::Address.city
  a.state = Faker::Address.state
  a.zip = Faker::Address.zip_code
  a.country = Faker::Address.country
  a.save
  a
end

def create_address_with_id
  a = create_address
  a.user_id = User.all.sample.id
  a.save
end

def create_user
  u = User.new
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name 
  u.email = Faker::Internet.email
  u.created_at = Faker::Time.between(365.days.ago, Date.today, :all)
  u.save
end

def create_credit_card
  c = CreditCard.new
  c.vender = Faker::Business.credit_card_type
  c.number = Faker::Business.credit_card_number
  c.csc = Faker::Number.number(3)
  c.expiration = Faker::Business.credit_card_expiry_date
  c.user_id = User.all.sample.id
  c.save
  c
end

(SEED_MULTIPLIER*20).times do
  create_user
end

(SEED_MULTIPLIER*50).times do
  create_address_with_id
end



def create_order
  o = Order.new
  u = User.all.sample
  o.user_id = u.id

  if u.phone_number
    o.phone_number = u.phone_number
  else 
    u.phone_number = o.phone_number = Faker::PhoneNumber.phone_number
    u.save
  end

  if u.default_shipping_address_id 
    o.shipping_address_id = u.default_shipping_address_id
  else
    new_address = create_address
    u.default_shipping_address_id = o.shipping_address_id = new_address.id
    new_address.user_id = u.id
    new_address.save
    u.save
  end

  if u.default_billing_address_id 
    o.billing_address_id = u.default_billing_address_id
  else
    new_address = create_address
    u.default_billing_address_id = o.billing_address_id = new_address.id
    new_address.user_id = u.id
    new_address.save
    u.save
  end

  cc_id = User.select("credit_cards.id").joins("JOIN credit_cards ON users.id = credit_cards.user_id").where("users.id = #{u.id}")
  
  if cc_id.empty?
    new_cc = create_credit_card
    o.credit_card_id = new_cc.id
    new_cc.user_id = u.id
    new_cc.save
  else
    o.credit_card_id = cc_id[0].id
  end

  o.save
end

(SEED_MULTIPLIER*30).times do
  create_address_with_id
end

(SEED_MULTIPLIER*30).times do
  create_credit_card
end

(SEED_MULTIPLIER*20).times do
  create_order
end

def associate_products_with_orders
  Order.all.each do |order|
    (rand(4)+1).times do
      p = ProductOrderJoin.new
      p.order_id = order.id
      p.product_id = Product.all.sample.id
      p.product_amount = 1 + rand(5)
      p.save
    end
  end
end

SEED_MULTIPLIER.times do
  associate_products_with_orders
end









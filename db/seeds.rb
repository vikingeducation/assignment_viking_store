
MULTIPLIER = 1

# -----------------------------------------------------------------
# Utils
# -----------------------------------------------------------------

def random_date
  rand(Time.new(2015, 1, 1)..Time.now)
end

# -----------------------------------------------------------------
# Core
# -----------------------------------------------------------------


def reset_database
  User.delete_all
  Profile.delete_all
  CreditCard.delete_all
  Address.delete_all
  Product.delete_all
  Category.delete_all
  ShoppingCart.delete_all
  Order.delete_all
end

def create_users
  join_date = random_date
  100.times do
    User.create(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      created_at: join_date,
      updated_at: join_date
    )
  end
end

def create_credit_cards
  usr_ids = User.all.map{ |usr| usr.id }
  100.times do
    CreditCard.create(
      user_id: usr_ids.pop,
      number: Faker::Business.credit_card_number,
      expiry_date: Faker::Business.credit_card_expiry_date,
      flag: Faker::Business.credit_card_type
    )
  end
end

def create_addresses
  address_qty = 100 * rand(1..5)
  address_qty.times do
    Address.create(
      user_id: User.pluck(:id).sample,
      line_1: Faker::Address.street_address,
      line_2: Faker::Address.secondary_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country,
      zip_code: Faker::Address.zip_code,
    )
  end
end

def create_profiles
  cc = CreditCard.all.to_a
  User.all.each do |usr|
    addresses = Address.where(:user_id => usr.id)
    address_id = addresses.blank? ? nil : addresses.first.id
    Profile.create(
    user_id: usr.id,
    phone_number: Faker::PhoneNumber.phone_number,
    credit_card_info: cc.pop.id,
    shipping_address: address_id,
    billing_address: address_id
    )
  end
end

def create_categories
  quantity = 2 * rand(3..6) * MULTIPLIER
  quantity.times do
    Category.create(
    :title => Faker::Commerce.department,
    :description => Faker::Lorem.sentence
    )
  end
end

def create_products
  quantity = 10 * rand(1..3) * MULTIPLIER
  quantity.times do
    Product.create(
      title: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      sku_number: Faker::Lorem.word + rand(1..9999999999999999).to_s,
      category_id: Category.pluck(:id).sample
    )
  end
end

def create_shopping_carts
  25.times do
    usr = User.pluck(:id).sample
    ShoppingCart.create(
      :user_id => usr,
      :checked_out => [true, false].sample,
      :shipping_address => Profile.find_by(:user_id => usr).shipping_address,
      :billing_address => Profile.find_by(:user_id => usr).billing_address,
    )
  end
end

def create_orders
  creation_date = random_date
  100.times do
    Order.create(
      product_id: Product.pluck(:id).sample,
      shopping_cart_id: ShoppingCart.pluck(:id).sample,
      created_at: creation_date
    )
  end
end


# Run
puts "Starting seeds...\n\n"

# make sure seeds file resets db
puts "Removing old data..."
reset_database
puts "Old data removed.\n\n"

# at least 100 users
puts "Creating users..."
create_users
# create profile related data
puts "Creating credit cards info..."
create_credit_cards
puts "Creating addresses..."
create_addresses
puts "Creating user profiles..."
create_profiles
# Have 10-30 products across a half-dozen-or-so categories
puts "Creating categories..."
create_categories
puts "Creating products..."
create_products
# populate at least 25 active shopping carts
puts "Creating shopping carts..."
create_shopping_carts
# populate a historical record of at least 100 orders staggered
# throughout the past year. Show growth in the rate of orders over time.
puts "Creating orders..."
create_orders

puts "All done.\n\n"

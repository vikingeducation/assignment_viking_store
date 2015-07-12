# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clear all existing tables
def clear_seeds
  Address.destroy_all
  CreditCard.destroy_all
  OrderProduct.destroy_all
  Order.destroy_all
  ProductCategory.destroy_all
  ProductDetail.destroy_all
  Product.destroy_all
  Shipment.destroy_all
  User.destroy_all
end


# Create 100 users


# Create 100 city options (not affected by seed mult)

# Create 5-10 state options (not affected by seed mult)


# Generate 0 to 5 addresses for each user, picking one for default billing & one for default shipping; randomize ZIP codes




# Create 6 categories

# Create 2-5 products per category


# Create 100 orders (plus shipments) for the past year, growing over time


# Create 25 active carts (not yet shipped)


# build in seed multiplier

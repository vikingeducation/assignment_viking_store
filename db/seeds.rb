# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BillingAddress.delete_all
Category.delete_all
CreditCard.delete_all
Order.delete_all
PhoneNumber.delete_all
ProductCategory.delete_all
Product.delete_all
ShippingAddress.delete_all
ShoppingCartProduct.delete_all
ShoppingCart.delete_all
UserProfile.delete_all
User.delete_all

generate_product_categories(5 * scale)
generate_products(25 * scale)
generate_users(200 * scale)
generate_customer_profiles(150 * scale) # Must be less than users
generate_extra_addresses(50 * scale)
generate_historical_orders(100 * scale)
fill_shopping_carts(25 * scale)

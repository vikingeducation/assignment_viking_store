# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require_relative 'seeds_helper'

# Wipe the slate clean with each run of seeds.rb.
ProductCategory.destroy_all
Product.destroy_all
User.destroy_all
Address.destroy_all
Order.destroy_all
OrderProduct.destroy_all
PaymentMethod.destroy_all
CustomerProfile.destroy_all

# Scale edited here.
scale = 1

# Repopulate all the categories.
generate_product_categories(5 * scale)
generate_products(25 * scale)
generate_users(200 * scale)   # Must be multiple of 5
generate_customer_profiles(1) # Must be less than users
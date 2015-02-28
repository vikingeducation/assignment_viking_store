# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require_relative 'seeds_helper'

start_deleting = Time.now

# Wipe the slate clean with each run of seeds.rb.
ProductCategory.delete_all
Product.delete_all
User.delete_all
Address.delete_all
Order.delete_all
OrderProduct.delete_all
PaymentMethod.delete_all
CustomerProfile.delete_all

start_creating = Time.now

# Scale edited here.
scale = 1

# Repopulate all the categories.
generate_product_categories(5 * scale)
generate_products(25 * scale)
generate_users(200 * scale)   # Must be multiple of 5
generate_customer_profiles(150 * scale) # Must be less than users
generate_extra_addresses(50 * scale)
generate_historical_orders(100 * scale)
fill_shopping_carts(25 * scale)

done_creating = Time.now

deletion_time = start_creating - start_deleting
creation_time = done_creating - start_creating

print "Deletion time\n#{deletion_time}\n\n"
print "Creation time\n#{creation_time}\n"

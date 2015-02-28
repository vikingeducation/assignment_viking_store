# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Wipe the slate clean with each run of seeds.rb.
ProductCategory.destroy_all
Product.destroy_all

# Entry generators live here.

def fake_product_category(id: id)
  { id: (id + 1),
    name: Faker::Commerce.department,
    description: Faker::Lorem.paragraph }
end

def generate_product_categories(qty)
  qty.times do |id|
    ProductCategory.create(fake_product_category(id: id))
  end
end

def fake_product(sku: sku)
  { sku: (sku + 1),
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    product_category_id: (rand(5) + 1) }
end

def generate_products(qty)
  qty.times do |sku|
    Product.create(fake_product(sku: sku))
  end
end

# Repopulate all the categories.
scale = 2
product_categories = generate_product_categories(5 * scale)
products = generate_products(25 * scale)
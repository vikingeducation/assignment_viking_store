# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Wipe the slate clean with each run of seeds.rb.
ProductCategory.destroy_all

# Entry generators live here.

def fake_product_category(id: id)
  { id: (id + 1),
    name: Faker::Commerce.department,
    description: Faker::Lorem.paragraph }
end

# Repopulate all the categories.
product_categories = 5.times { |time|  ProductCategory.create(fake_product_category(id: time)) }
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def reset_database
  User.delete_all
  Profile.delete_all
  CreditCard.delete_all
  Address.delete_all
  Product.delete_all
  Category.delete_all
  Order.delete_all
  OrderProduct.delete_all
end

# Run
puts "Starting seeds...\n\n"

puts "Removing old data..."
reset_database
puts "Old data removed.\n\n"

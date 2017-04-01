# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MULTIPLIER = 10

puts "Starting seeds...\n\n"
start_time = Time.now

puts "Removing old data..."
User.delete_all
Customer.delete_all
Product.delete_all
Address.delete_all
Category.delete_all
City.delete_all
State.delete_all
Cart.delete_all
Order.delete_all
CustomerAddrRef.delete_all
CustomerAddrTypeRef.delete_all
puts "Old data removed.\n\n"

puts "Creating users..."

User.create


puts "Creating customers..."
puts "Creating products..."
puts "Creating addresses..."
puts "Creating categories..."
puts "Creating cities..."
puts "Creating states..."
puts "Creating carts..."
puts "Creating orders..."
puts "Creating address types..."
puts "Creating customer address references..."
puts "Creating customer address types references..."





puts "\n\nDatabase is seeded now!!!"
puts "It took #{Time.now - start_time} seconds."


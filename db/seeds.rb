# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Starting seeds...\n\n"
start_time = Time.now

puts "Removing old data..."
# Blow away the existing data
Address.delete_all
Category.delete_all
CreditCard.delete_all
Order.delete_all
PhoneNum.delete_all
Product.delete_all
User.delete_all
puts "Old data removed.\n\n"

# increase your seed size by changing this
# NOTE: This can make it take MUCH longer!
# A value of 10 can take over 3 minutes
MULTIPLIER = 5

puts "Creating users..."
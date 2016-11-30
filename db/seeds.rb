# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create 100 users staggered over time, with an increasing join rate
# as time goes on

# CREATING USERS

puts "Cleaning database"
if Rails.env == 'development'
  Rake::Task['db:migrate:reset'].invoke
end

25.times do |i|
  User.create(name: Faker::Name.name, email: Faker::Internet.email, created_at: Faker::Time.between(DateTime.now - 365, DateTime.now - 180))
end

25.times do |i|
  User.create(name: Faker::Name.name, email: Faker::Internet.email, created_at: Faker::Time.between(DateTime.now - 180, DateTime.now - 90))
end

50.times do |i|
  User.create(name: Faker::Name.name, email: Faker::Internet.email, created_at: Faker::Time.between(DateTime.now - 90, DateTime.now))
end

User.all.each do |user|
  num_addresses = (0..5).to_a.sample
  num_addresses.times do |i|
    city = Faker::Address.city
    Address.new
  end
end


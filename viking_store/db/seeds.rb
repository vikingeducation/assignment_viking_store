# # Plantin' those seeds in the DB.

# # Run 'rake db:reset' to clear the database before running the script.



USERS_FIRST = %w{ Matt Simon Jordan Scott Joy Melissa }
USERS_LAST  = %w{ Davis Estrada Martin Kietzman Kim Garganta }

6.times do |i|
	u = User.new
	u.first_name = USERS_FIRST[i]
	u.last_name  = USERS_LAST[i]
	u.email      = Faker::Internet.email("#{u.first_name}")
	u.phone_number = Faker::Number.number(10)
	u.save
end

20.times do 
	a = Address.new
	a.street_address = Faker::Address.street_address
	a.city = Faker::Address.city
	a.state = Faker::Address.state_abbr
	a.zip = Faker::Address.zip
	a.save
end

c = Category.new
c.title = "Axes"
c.description = Faker::Lorem.paragraph
c.save

c = Category.new
c.title = "Bows"
c.description = Faker::Lorem.paragraph
c.save

PRODUCTS = ["Cunning Cutter", "Dainty Daisy", "Double Trouble", "Kingmaker", "Silent Night", "Whispering Wind"]

6.times do |i|
	p = Product.new
	p.title = PRODUCTS[i]
	p.description = Faker::Lorem.paragraph
	p.price = Faker::Commerce.price
	p.save
end













































	



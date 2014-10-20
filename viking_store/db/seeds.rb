# # Plantin' those seeds in the DB.

# # Run 'rake db:reset' to clear the database before running the script.



# # SET SCALE

# scale = 10

# # Generate States

# states =
# ["Alabama", "Alaska", "Arizona","California", "Colorado", "Connecticut", 
# "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", 
# "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts","Mississippi", 
# "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Dakota", 
# "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina",
# "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", 
# "Wisconsin", "Wyoming"]
 
# states.each do |state|
#   State.new({:name => state})
# end

# # Generate Addresses
# # Should always have bigger scale than User to ensure 2 addresses 
# # are added

# 2.times do 
  
#   a = Address.new
#   a[:user_id]        = rand(1..scale) 
#   a[:street_address] = Faker::Address.street_address
#   a[:city]           = Faker::Address.city 
#   a[:state]          = states[rand(states.size + 1)]
#   a[:zip]            = Faker::Address.zip
#   a.save

# end


# # Generate Users

# def date_joined
# 	times_array = []
# 	10.times do |x|
# 		times_array << Time.now - (x * 2).month
# 	end
# 	range = (times_array.sample..Time.now)
# 	rand(range)
# end

# def find_address(userid)
# 	address = Address.where(:user_id => "#{userid}")
# 	address[:id]
# end

# 2.times do 
# 	rando_name = [Faker::Name.first_name, Faker::Name.last_name]

# 	u = User.new
# 	u[:first_name]           = rando_name[0]
# 	u[:last_name]            = rando_name[1]
#   u[:email]                = Faker::Internet.email(rando_name.join(" "))
#   u[:phone_number]         = Faker::Number.number(10)
#   u[:default_billing_id]   = find_address(u[:id])
#   u[:default_shipping_id]  = # TODO
#   u[:created_at]           = date_joined
#   u.save

# end


# # Generate Categories

# 6.times do
#   c = Category.new
#   c[:title]       = Faker::Commerce.department
#   c[:description] = Faker::Lorem.sentence
#   c.save
# end 


# # # Generate Products

# 1.times do
# 	p = Product.new
# 	p[:title]       = Faker::Commerce.product_name
# 	p[:description] = Faker::Lorem.sentence
# 	p[:price]       = Faker::Commerce.price
# 	p[:sku_num]     = Faker::Number.number(7)
#   p[:category_id] = rand(1..Category.count)
#   p.save
# end


# # # Generates Orders

# # 1.times do
# # 	o = Order.new
# # 	o[:user_id]    =
# # 	o[:product_id] =
# # 	o[:quantity]   =
# # 	o[:created_at] =
# # 	o.save
# # end



# # # Generates credit_cards

# 1.times do
# 	c = CreditCard.new
# 	c[:user_id]           = 
#   c[:card_number]       = Faker::Number.number(16)
#   c[:expiration_month]  = %w{Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec}.sample
#   c[:expiration_year]   = rand(2014..2020)
#   c[:type]              = ["Visa", "Mastercard", "American Express"].sample
#   c.save
# end



# # # Generates Order Details

# # 1.times do
# # 	d = OrderDetail.new
# # 	d[:order_id]       =
# #   d[:price]          =
# #   d[:quantity]       =
# #   d[:checked_out]    =
# #   d[:type]           = 
# #   d.save
# # end









































	



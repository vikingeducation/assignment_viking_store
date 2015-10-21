State.destroy_all
City.destroy_all
User.destroy_all

SEED_MULTIPLIER = 5

# Use weighted random numbers from pickup gem to increase growth of users
# over the last year, more joining each quarter.  Same method for order growth.  
# We're using the Faker::Time.backward method with these numbers as days ago.
def weighted_growth(amount_needed)
  random_numbers = []
  time_span = 365
  qtr = time_span/4

  q4 = (0..qtr)
  q3 = (qtr..(qtr*2))
  q2 = ((qtr*2)..(qtr*3))
  q1 = ((qtr*3)..time_span)
  rand_qtr = Pickup.new({q1 => 4, q2 => 5, q3 => 7, q4 => 9 })

  amount_needed.times do
    random_numbers << rand(rand_qtr.pick)
  end

  random_numbers
end

# Popular cities, decided to keep cities and states together here
# So seed data would look better
def popular_cities
  popular_cities = []
  random_cities = City.limit(2*SEED_MULTIPLIER).order("RANDOM()").ids
  states = ALL_STATES.shuffle

  random_cities.each do |city_id|
    popular_cities << [city_id, states.pop, rand(10000..90000)]
  end

  popular_cities
end


#Create unique states
until State.count == 15
  begin
    State.create(name: Faker::Address.state)
  rescue ActiveRecord::RecordNotUnique
    retry
  end
end

ALL_STATES = State.all.ids.shuffle


# Create cities
(20*SEED_MULTIPLIER).times do
  City.create(name: Faker::Address.city)
end

ALL_CITIES = City.all.ids.shuffle
POPULAR_CITIES = popular_cities


# Create users, unique email
user_count = 20 * SEED_MULTIPLIER
join_days = weighted_growth(user_count)

(user_count).times do
  begin
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email(first_name)
    phone = Faker::PhoneNumber.phone_number
    join_date = Faker::Time.backward(join_days.pop, :all)
    user = User.create( first_name: first_name,
                        last_name:  last_name,
                        email:      email,
                        phone:      phone,
                        join_date:  join_date )

    # Create user's address(es)
    addr_ids = []

    rand(0..5).times do
      popular = POPULAR_CITIES.sample
      street = Faker::Address.street_address

      # 50/50 chance of popular city
      case rand(0..1)
      when 0
        city = popular[0]
        state = popular[1]
        zip = popular[2]
      when 1
        city = ALL_CITIES.sample
        state = ALL_STATES.sample
        zip = rand(10000..90000)
      end

      addr = user.addresses.create( street:   street,
                                    city_id:  city,
                                    state_id: state,
                                    zip:      zip )
      addr_ids << addr.id
    end

    if addr_ids.length >= 2
      user.default_ship_address_id = addr_ids.sample
      user.default_bill_address_id = addr_ids.sample
      user.save!
    end

    

  rescue ActiveRecord::RecordNotUnique
    retry
  end
end

ALL_USERS = Category.all.ids


# Create categories
12.times do
  Category.create(name: Faker::Commerce.department)
end

ALL_CATEGORIES = Category.all.ids


# Create products
(10*SEED_MULTIPLIER).times do
  begin
  Product.create( title:       Faker::Commerce.product_name,
                  description: Faker::Lorem.paragraph,
                  sku:         Faker::Code.isbn,
                  price:       Faker::Commerce.price,
                  category_id: ALL_CATEGORIES.sample )
  rescue ActiveRecord::RecordNotUnique
    retry
  end
end

# # Create shopping carts (orders that haven't been purchased/completed)
# (25*SEED_MULTIPLIER).times do
#   user = ALL_USERS.sample
#   order = user.orders.create(bill_address_id: user.addresses.sample.id,
#                              ship_address_id: user.addresses.sample.id)

# end

# Remember, base purchase date off rand between user join_date and now
# will naturally grow orders alongside user growth
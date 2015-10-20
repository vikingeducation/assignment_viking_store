State.destroy_all
City.destroy_all
User.destroy_all

SEED_MULTIPLIER = 5

# Use weighted random numbers from pickup gem to increase growth of users
# over the last year, more joining each quarter.
def weighted_growth(user_count)
  random_numbers = []
  time_span = 365
  qtr = time_span/4

  q1 = (0..qtr)
  q2 = (qtr..(qtr*2))
  q3 = ((qtr*2)..(qtr*3))
  q4 = ((qtr*3)..time_span)
  rand_qtr = Pickup.new({q1 => 4, q2 => 7, q3 => 9, q4 => 12 })

  user_count.times do
    random_numbers << rand(rand_qtr.pick)
  end

  random_numbers
end

#Create unique states
until State.count == 15
  begin
    State.create(name: Faker::Address.state)
  rescue ActiveRecord::RecordNotUnique
    retry
  end
end

# Create cities
(20*SEED_MULTIPLIER).times do
  City.create(name: Faker::Address.city)
end

# Create users, unique email
user_count = 20*SEED_MULTIPLIER
join_dates = weighted_growth(user_count)
(user_count).times do
  begin
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email(first_name)
    phone = Faker::PhoneNumber.phone_number
    join_date = Faker::Time.between(join_dates.pop.days.ago, Time.now, :all)
    User.create(first_name: first_name,
                last_name:  last_name,
                email:      email,
                phone:      phone,
                join_date:  join_date)
  rescue ActiveRecord::RecordNotUnique
    retry
  end
end
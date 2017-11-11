# ---
# Constants
# ---
# STATES = [
#   "Alabama",
#   "Alaska",
#   "Arizona",
#   "Arkansas",
#   "California",
#   "Colorado",
#   "Connecticut",
#   "Delaware",
#   "Florida",
#   "Georgia",
#   "Hawaii",
#   "Idaho",
#   "Illinois",
#   "Indiana",
#   "Iowa",
#   "Kansas",
#   "Kentucky",
#   "Louisiana",
#   "Maine",
#   "Maryland",
#   "Massachusetts",
#   "Michigan",
#   "Minnesota",
#   "Mississippi",
#   "Missouri",
#   "Montana",
#   "Nebraska",
#   "Nevada",
#   "New Hampshire",
#   "New Jersey",
#   "New Mexico",
#   "New York",
#   "North Carolina",
#   "North Dakota",
#   "Ohio",
#   "Oklahoma",
#   "Oregon",
#   "Pennsylvania",
#   "Rhode Island",
#   "South Carolina",
#   "South Dakota",
#   "Tennessee",
#   "Texas",
#   "Utah",
#   "Vermont",
#   "Virginia",
#   "Washington",
#   "West Virginia",
#   "Wisconsin",
#   "Wyoming"
# ]

MULTIPLIER = 10


# Remove existing data
Address.delete_all
User.delete_all

# create_states
STATES.each do |state_name|
  State.create(:name => state_name)
  num_states_created += 1
  print_num_of(num_states_created, num_states)
end

# create_addresses
MULTIPLIER.times do
  Address.create(
    line_1: Faker::Address.street_address,
    line_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip
  )
end
# create_users
MULTIPLIER.times do
  mail_add, bill_add = Address.pluck(:id).sample(2)
  # if [true, false].sample
  #   bill_add = mail_add
  # end
  bill_add = mail_add if [true, false].sample
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    default_mail: mail_add,
    default_bill: bill_add,
    phone: Faker::PhoneNumber.phone_number
  )
end

# create_categories
MULTIPLIER.times do



end


# create_products

  #

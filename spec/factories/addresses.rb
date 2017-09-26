require 'faker/address'

FactoryGirl.define do

  factory :address do
    street_1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    post_code { Faker::Address.postcode }
  end

end
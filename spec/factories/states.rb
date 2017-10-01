require 'faker/address'

FactoryGirl.define do
  factory :state do
    name { Faker::Address.state }
    abbrev { Faker::Address.state_abbr }
  end
end

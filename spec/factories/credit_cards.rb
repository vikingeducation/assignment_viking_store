require 'faker/business'

FactoryGirl.define do

  factory :credit_card do
    number { Faker::Business.credit_card_number }
    expiration { Faker::Business.credit_card_expiry_date }

    user
  end

end
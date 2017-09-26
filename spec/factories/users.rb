require 'faker/name'
require 'faker/internet'

FactoryGirl.define do

  factory :user do
    email { Faker::Internet.safe_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    factory :user_with_card do
      after(:build) { |user| user.credit_cards << build(:credit_card) }
    end

    factory :user_with_shipping_address do
      after(:build) { |user| user.addresses << build(:address) }
    end

    factory :user_with_default_shipping_address do
      after(:create) do |user|
        create(:user_address, :default, user: user)
      end
    end
  end

end






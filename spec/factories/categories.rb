require 'faker/commerce'

FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.department }
  end
end

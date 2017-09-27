require 'faker/commerce'

FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.product_name }
  end
end

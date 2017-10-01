require 'faker/commerce'

FactoryGirl.define do
  factory :product do
    category

    title { Faker::Commerce.product_name }
  end
end

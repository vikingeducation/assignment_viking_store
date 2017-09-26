FactoryGirl.define do

  factory :user_address do
    user
    address

    trait :default do
      default_address true
    end
  end

end
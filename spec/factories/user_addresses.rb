FactoryGirl.define do

  factory :user_address do
    user
    address

    factory :user_address_billing do
      after(:create) do |user_address|
        user_address.address.update_attributes addr_type: :billing
      end
    end

    trait :default do
      default_address true
    end
  end

end
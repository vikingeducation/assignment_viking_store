FactoryGirl.define do
  factory :order do
    association :user, factory: :user_with_default_addresses
    cart

    billing_address_id { user.billing_address.id }
    shipping_address_id { user.shipping_address.id }
  end
end
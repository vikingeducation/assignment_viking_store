class Profile < ApplicationRecord
  has_one :credit_card
  has_one :billing_address, :class_name => 'Address'
  has_one :shipping_address, :class_name => 'Address'
  has_many :addresses
  belongs_to :user
end

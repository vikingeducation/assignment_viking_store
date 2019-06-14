class Address < ApplicationRecord
  ADDRESS_TYPES = [
    :shipping_and_billing, :shipping, :billing,
    :default_shipping, :default_billing, :default_shipping_and_billing
  ].freeze

  belongs_to :user
  belongs_to :city

  delegate :state, to: :city
  enum address_type: ADDRESS_TYPES
end

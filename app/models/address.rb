class Address < ApplicationRecord
  belongs_to :address_type
  belongs_to :user
  belongs_to :state

  scope :billing, -> { joins(:address_type).where('address_types.name = ?', 'Billing') }
  scope :shipping, -> { joins(:address_type).where('address_types.name = ?', 'Shipping') }

end

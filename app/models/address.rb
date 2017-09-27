class Address < ApplicationRecord
  has_many :user_addresses
  has_many :users, through: :user_addresses

  has_many :orders_as_billing_address, :class_name => 'Order', :foreign_key => 'billing_address_id'
  has_many :orders_as_shipping_address, :class_name => 'Order', :foreign_key => 'shipping_address_id'

  enum addr_type: { shipping: 0, billing: 1 }

  validates :street_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :post_code, presence: true

end

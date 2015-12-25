class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :state
  has_many :orders, foreign_key: 'shipping_address_id'
  has_many :orders, foreign_key: 'billing_address_id'
end

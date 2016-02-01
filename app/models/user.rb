class User < ActiveRecord::Base
  has_many :orders
  has_one :shopping_cart

  has_many :addresses_users
  has_many :addresses, through: :addresses_users

  belongs_to :shipping_address, class_name: 'Address'
  belongs_to :billing_address, class_name: 'Address'
end

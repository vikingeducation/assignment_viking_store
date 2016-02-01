class User < ActiveRecord::Base
  has_many :addresses, through: :users_addresses
  belongs_to :shipping_address, class_name: 'Address', foreign_key: :shipping_address_id
  belongs_to :billing_address, class_name: 'Address', foreign_key: :billing_address_id
end

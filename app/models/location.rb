class Location < ActiveRecord::Base
  has_many :shipping_addresses, class_name: "User", foreign_key: "default_shipping_address_id"
  has_many :billing_addresses, class_name: "User", foreign_key: "default_billing_address_id"
  has_many :shipping_addresses, class_name: "Order", foreign_key: "shipping_address_id"
  has_many :billing_addresses, class_name: "Order", foreign_key: "billing_address_id"
  belongs_to :user
end

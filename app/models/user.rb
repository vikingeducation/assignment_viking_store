class User < ActiveRecord::Base
  belongs_to :default_shipping_address, :class_name => "Location"
  belongs_to :default_billing_address, :class_name => "Location"
  has_many :locations
  has_many :orders
end

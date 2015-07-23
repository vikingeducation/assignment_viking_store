class Order < ActiveRecord::Base
  belongs_to :shipping_address, :class_name => "Location"
  belongs_to :billing_address, :class_name => "Location"
  belongs_to :users
end

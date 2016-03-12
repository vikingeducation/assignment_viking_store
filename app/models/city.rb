class City < ActiveRecord::Base
  has_many :shipping_addresses
  has_many :billing_addresses
end

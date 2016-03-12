class ShippingAddress < ActiveRecord::Base
  belongs_to :customer
  belongs_to :city
  belongs_to :state
end

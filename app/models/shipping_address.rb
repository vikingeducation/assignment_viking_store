class ShippingAddress < ActiveRecord::Base
  belongs_to :customer
  has_many :orders
  belongs_to :city
  belongs_to :state

end

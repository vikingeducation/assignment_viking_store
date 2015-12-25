class ShippingAddress < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :state
  has_many :orders
end

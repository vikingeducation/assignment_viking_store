class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :shipping_address
  belongs_to :billing_address
  has_and_belongs_to_many :products
end

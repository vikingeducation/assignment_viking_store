class Order < ActiveRecord::Base
  belongs_to :user
  has_one :payment
  has_many :order_contents
  has_many :products, through: :order_contents
end

class Order < ActiveRecord::Base
  belongs_to :user
  has_one :order_content
  has_many :products, through: :order_content
end

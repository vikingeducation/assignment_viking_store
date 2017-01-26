class Order < ApplicationRecord
	belongs_to :user
	belongs_to :payment
	has_many :purchases
	has_many :products, through: :purchases
end

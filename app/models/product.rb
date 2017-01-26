class Product < ApplicationRecord
	belongs_to :category
	has_many :purchases
	has_many :orders, through: :purchases
end

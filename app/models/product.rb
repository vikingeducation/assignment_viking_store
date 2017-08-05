class Product < ApplicationRecord
	has_many :order_contents
	has_many :orders, through: :order_contents

	belongs_to :category
end

class Product < ApplicationRecord
	belongs_to :order
	has_one :sku, primary_key: :sku
end

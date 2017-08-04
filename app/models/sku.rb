class Sku < ApplicationRecord
	belongs_to :product, primary_key: :product
end

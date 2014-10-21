class Product < ActiveRecord::Base
	def self.products(time)
		Product.where('created_at > ?', time).count
	end

	def self.all_products
		Product.count
	end
	
end

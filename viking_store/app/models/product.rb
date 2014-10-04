class Product < ActiveRecord::Base

	def self.products_from_last_week
		Product.where('created_at > ?',1.week.ago).count
	end

end

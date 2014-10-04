class Product < ActiveRecord::Base

	def self.products(time)
		Product.where('created_at > ?',time).count
	end

end

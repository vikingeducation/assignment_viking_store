class Order < ActiveRecord::Base
	def self.orders(time)
		Order.where('is_placed = ? AND placed_at > ?',true,time).count
	end
end

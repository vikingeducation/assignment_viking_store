class Order < ActiveRecord::Base
	def self.orders_last_week
		Order.where('is_placed = ? AND placed_at > ?',true,1.week.ago).count
	end
end

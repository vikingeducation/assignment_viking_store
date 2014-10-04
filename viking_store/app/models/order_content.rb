class OrderContent < ActiveRecord::Base

	def self.revenue(time)
		OrderContent.joins(
			"JOIN orders 
			 ON orders.id  = order_contents.id").where(
			 	'orders.placed_at > ?',time).select(
			 		"quantity*current_price AS revenue").map(&:revenue).inject(&:+).round(2)
	end

end

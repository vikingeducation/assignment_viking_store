class OrderDetail < ActiveRecord::Base
	def self.revenue(time)
    OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").where("checked_out = ? AND checkout_time > ?", true, time).sum(:price)
	end

	def self.total_revenue
		OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").where("checked_out = ?", true).sum(:price)
	end

  def self.largest_order(time)
    OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").where("checked_out = ? AND checkout_time > ?", true, time).order("price DESC").first.price
  end

  def self.highest_order_value
  	OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").where("checked_out = ?", true).order(price: :desc).first.price
  end

end

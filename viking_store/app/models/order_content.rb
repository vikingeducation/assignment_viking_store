class OrderContent < ActiveRecord::Base

	def self.revenue(time)
		OrderContent.joins(
			"JOIN orders ON orders.id  = order_contents.id").
			where('orders.placed_at > ?',time).
			select("quantity*current_price AS revenue").
			map(&:revenue).inject(&:+).round(2)
	end

	def self.highest_first
		User.find(OrderContent.joins("JOIN orders ON orders.id  = order_contents.id").where('orders.is_placed = ?',true).select("user_id, quantity*current_price AS revenue").order("revenue DESC")[0].user_id).first_name
	end

	def self.highest_last
		User.find(OrderContent.joins("JOIN orders ON orders.id  = order_contents.id").where('orders.is_placed = ?',true).select("user_id, quantity*current_price AS revenue").order("revenue DESC")[0].user_id).last_name
	end

	def self.highest_single_value
  	OrderContent.joins("JOIN orders ON orders.id  = order_contents.id").where('orders.is_placed = ?',true).select("quantity*current_price AS revenue").order("revenue DESC")[0].revenue.round(2)  # figure out for two decimals
  end

  def self.highest_lifetime
  	OrderContent.
  	joins("JOIN orders ON orders.id = order_contents.id").
  	where('orders.is_placed = ?',true).
  	select("user_id, SUM(quantity*current_price) AS revenue").
  	group(:user_id).order("revenue DESC")[0].
  	revenue.round(2)
  end

  def self.highest_lifetime_first
    User.find(OrderContent.joins("JOIN orders ON orders.id = order_contents.id").
      where('orders.is_placed = ?',true).
      select("user_id, SUM(quantity*current_price) AS revenue").
      group(:user_id).order("revenue DESC")[0].user_id).first_name
  end

  def self.highest_lifetime_last
    User.find(OrderContent.joins("JOIN orders ON orders.id = order_contents.id").
      where('orders.is_placed = ?',true).
      select("user_id, SUM(quantity*current_price) AS revenue").
      group(:user_id).order("revenue DESC")[0].user_id).last_name
  end

end

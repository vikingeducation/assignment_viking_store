class OrderDetail < ActiveRecord::Base
	def self.revenue(time)
    OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
    where("checked_out = ? AND checkout_time > ?", true, time).
    sum(:price)
	end

	def self.total_revenue
		OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
		where("checked_out = ?", true).
		sum(:price)
	end

  def self.largest_order(time)
    OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
    where("checked_out = ? AND checkout_time > ?", true, time).
    order("price DESC").first.price
  end

  def self.highest_order_value
  	OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
  	where("checked_out = ?", true).
  	order(price: :desc).first.price
  end

  def self.highest_order_first_name
  	User.find(OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
  	where("checked_out = ?", true).
  	select("user_id, price").
  	order(price: :desc)[0].user_id).first_name
  end

  def self.highest_order_last_name
  	User.find(OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
  	where("checked_out = ?", true).
  	select("user_id, SUM(price)").
  	group(:user_id).order(price: :desc)[0].user_id).last_name
  end

  def self.highest_lifetime_user_first
  	User.find(OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
  	where("checked_out = ?", true).
  	select("user_id, SUM(price) AS price").
  	group(:user_id).order(price: :desc)[0].user_id).first_name
  end

  def self.highest_lifetime_user_last
  	User.find(OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
  	where("checked_out = ?", true).
  	select("user_id, SUM(price) AS price").
  	group(:user_id).order(price: :desc)[0].user_id).last_name
  end

  def self.highest_lifetime_order_value
  	OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
  	where("checked_out = ?", true).
  	select("orders.user_id, SUM(price) AS price").
  	group(:user_id).order(price: :desc)[0].price
  end

  def self.highest_avg_order_first
  	User.find(OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
  	where("checked_out = ?", true).
  	select("user_id, AVG(price) AS price").
  	group(:user_id).order(price: :desc)[0].user_id).first_name
  end

  def self.highest_avg_order_last
  	User.find(OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
  	where("checked_out = ?", true).
  	select("user_id, AVG(price) AS price").
  	group(:user_id).order(price: :desc)[0].user_id).last_name
  end

  def self.highest_avg_order_value
  	OrderDetail.joins("JOIN orders ON orders.id = order_details.order_id").
  	where("checked_out = ?", true).
  	select("orders.user_id, AVG(price) AS price").
  	group(:user_id).order(price: :desc)[0].price
  end
  
  belongs_to :order
  
end

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
  	OrderContent.joins("JOIN orders ON orders.id = order_contents.id").where('orders.is_placed = ?',true).select("user_id, SUM(quantity*current_price) AS revenue").group(:user_id).order("revenue DESC")[0].revenue.round(2)
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

  def self.highest_average
    @user_first,@user_last,max = nil,nil,0
    user_hash=OrderContent.joins("JOIN orders ON orders.id = order_contents.id").where('orders.is_placed = ?',true).select("user_id, SUM(quantity*current_price) AS revenue").group(:user_id).size
    
    user_hash.each do |uid,count|
      user_rev = OrderContent.joins("JOIN orders ON orders.id = order_contents.id").where('orders.is_placed = ? AND user_id = ?',true,uid).select("user_id, SUM(quantity*current_price) AS revenue").group(:user_id)[0].revenue
      if (user_rev/count) > max
        max = (user_rev/count)
        @user_first = User.find(uid).first_name
        @user_last = User.find(uid).last_name
      end
    end
    [max,@user_first,@user_last]
  end

  def self.largest_order(time) #panel 3 largest order
    OrderContent.joins("JOIN orders ON orders.id  = order_contents.id").where('orders.is_placed = ? AND orders.placed_at > ?',true, time).select("quantity*current_price AS revenue").order("revenue DESC")[0].revenue
  end


end

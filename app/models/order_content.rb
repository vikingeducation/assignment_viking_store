class OrderContent < ActiveRecord::Base

  def return_highest_so
  @first_name = User.find(OrderContent.joins("JOIN orders ON orders.order_id  = order_contents.id").where("orders.is_placed = ?",true).select("user_id, order_contents.quantity * order_contents.current_price AS revenue").order("revenue DESC")[0].user_id).first_name
  @last_name = User.find(OrderContent.joins("JOIN orders ON orders.order_id  = order_contents.id").where("orders.is_placed = ?",true).select("user_id, order_contents.quantity * order_contents.current_price AS revenue").order("revenue DESC")[0].user_id).last_name
  @value = OrderContent.joins("JOIN orders ON orders.order_id  = order_contents.id").where("orders.is_placed = ?",true).select("user_id, order_contents.quantity * order_contents.current_price AS revenue").order("revenue DESC")[0].revenue
  [@first_name.to_s + @last_name.to_s, @value]

  end

def return_highest_lv
  @first_name = User.find(OrderContent.joins("JOIN orders ON orders.order_id = order_contents.order_id").where("orders.is_placed = ?",true).select("user_id, SUM(order_contents.quantity * order_contents.current_price) AS revenue").group(:user_id).order("revenue DESC")[0].user_id).first_name

  @last_name = User.find(OrderContent.joins("JOIN orders on orders.order_id = order_contents.order_id").where("orders.is_placed = ?",true).select("user_id ,SUM(order_contents.quantity * order_contents.current_price) AS revenue").group(:user_id).order("revenue DESC")[0].user_id).last_name

  @value = OrderContent.joins("JOIN orders on orders.order_id = order_contents.order_id").where("orders.is_placed = ?",true).select("user_id,SUM(order_contents.quantity * order_contents.current_price) AS revenue").group(:user_id).order("revenue DESC")[0].revenue [@first_name.to_s + @last_name.to_s, @value]
  end

  def revenue_since(interval=nil)
    if interval
      @value =  OrderContent.joins("JOIN orders ON orders.order_id = order_contents.order_id").where('orders.when_placed > ?', interval).select("order_contents.quantity * order_contents.current_price AS revenue").reduce(:+)
    else
      @value =  OrderContent.joins("JOIN orders ON orders.order_id = order_contents.order_id").where("orders.is_placed = ?", true).select("order_contents.quantity * order_contents.current_price AS revenue").reduce(:+)
    end
  end

  # def avg_val(interval)
  #   @value = OrderContent.joins("JOIN orders ON orders.order_id = order_contents.order_id").where('orders.when_placed > ?', interval).select("quantity*current_price AS revenue").reduce(:+) / OrderContent.where("when_placed > ?", interval).count
  # end

  def lov_since(interval=nil)
    if interval
      OrderContent.joins("JOIN orders ON order_contents.order_id = orders.order_id").select("SUM(order_contents.quantity * order_contents.current_price) AS lov").where("orders.when_placed > ?", interval).order("lov DESC").group("orders.order_id")[0].lov
    else
      OrderContent.joins("JOIN orders ON order_contents.order_id = orders.order_id").select("SUM(order_contents.quantity * order_contents.current_price) AS lov").where("orders.is_placed = ?", true).order("lov DESC").group("orders.order_id")[0].lov
    end
  end

  def self.revenue_on(date)
    OrderContent.joins("JOIN orders ON orders.order_id = order_contents.order_id").where('orders.when_placed = ?', date).select("order_contents.quantity * order_contents.current_price AS revenue").reduce(:+)
  end

  def self.revenue_in(start_date)
    OrderContent.joins("JOIN orders ON orders.order_id = order_contents.order_id").where("when_placed > ? AND when_placed < ?", start_date, start_date+7).select("order_contents.quantity * order_contents.current_price AS revenue").reduce(:+)
  end

end

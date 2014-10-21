class Order < ActiveRecord::Base
	def self.orders(time)
    Order.where('checkout_time > ?', time).count
  end
  
  def self.all_orders
  	Order.count
  end

end

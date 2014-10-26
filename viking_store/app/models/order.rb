class Order < ActiveRecord::Base
	def self.orders(time)
    Order.where('checkout_time > ?', time).count
  end
  
  def self.all_orders
  	Order.count
  end

  belongs_to :user
  has_many   :order_details

end

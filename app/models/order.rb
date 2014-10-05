class Order < ActiveRecord::Base

  def self.orders_during(interval)
    # return a count of orders over an internal of time
    Order.where("when_placed > ?", interval).count
  end

end

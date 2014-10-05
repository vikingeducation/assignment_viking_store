class Order < ActiveRecord::Base

  def self.orders_during(interval=nil)
    # return a count of orders over an internal of time
    if interval
      Order.where("when_placed > ?", interval).count
    else
      Order.count
    end
  end

end

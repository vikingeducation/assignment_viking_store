class Order < ActiveRecord::Base

  def self.orders_since(interval=nil)
    # return a count of orders over an internal of time
    if interval
      Order.where("when_placed > ?", interval).count
    else
      Order.count
    end
  end

  def self.orders_on(date)
    Order.where("when_placed = ?", date).count
  end

  def self.orders_in(start_date)
    Order.where("when_placed > ? AND when_placed < ?", start_date, start_date+7)).count
  end

end
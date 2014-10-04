class Purchase < ActiveRecord::Base

  def self.revenue(last_x_days = nil)

    if last_x_days
      Purchase.joins("JOIN products ON purchases.product_id = products.id JOIN orders ON orders.id = purchases.order_id").where("orders.checkout_date > ?", Time.now - last_x_days.days).sum("(purchases.quantity * products.price)")
    else
      Purchase.joins("JOIN products ON purchases.product_id = products.id JOIN orders ON orders.id = purchases.order_id").sum("(purchases.quantity * products.price)")
    end

  end
end
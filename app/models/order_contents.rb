class OrderContents < ActiveRecord::Base


  belongs_to :order
  belongs_to :product

  # for any ONE order, a product ID should only appear once
  validates :product_id, uniqueness: { scope: :order_id }

  def self.revenue(last_x_days = nil)

    if last_x_days
      joins("JOIN products ON order_contents.product_id = products.id JOIN orders ON orders.id = order_contents.order_id").
      where("orders.checkout_date > ?", Time.now - last_x_days.days).
      sum("(order_contents.quantity * products.price)")
    else
      joins("JOIN products ON order_contents.product_id = products.id JOIN orders ON orders.id = order_contents.order_id").
      sum("(order_contents.quantity * products.price)")
    end

  end

end

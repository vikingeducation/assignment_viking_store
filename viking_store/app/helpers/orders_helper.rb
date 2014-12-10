module OrdersHelper

	def checked_out(order)
  	order.checked_out ? "PLACED" : content_tag(:span, "UNPLACED", class: "unplaced")
  end
  
  def product_quantity(order)
    order.order_details.sum("quantity")
  end

end

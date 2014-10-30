module OrdersHelper

	def checked_out(order)
  	order.checked_out ? "PLACED" : content_tag(:span, "UNPLACED", class: "unplaced")
  end
  
end

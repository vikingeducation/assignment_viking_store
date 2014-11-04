class AnalyticsDashboardController < ApplicationController
	
	layout "dashboard"

	def dashboard

		@week    = 7.days.ago
		@month   = 30.days.ago

		dashboard_1
		dashboard_2
		dashboard_3
		# dashboard_4

	end


	def dashboard_1
		@new_users_7    = User.users(@week)
	 	@orders_7       = Order.orders(@week)
	 	@new_prods_7    = Product.products(@week)
	  @revenue_7      = OrderDetail.revenue(@week)

	 	@new_users_30   = User.users(@month) 
	 	@orders_30      = Order.orders(@month)
	 	@new_prods_30   = Product.products(@month)
	 	@revenue_30     = OrderDetail.revenue(@month)

	 	@total_users    = User.all_users
	 	@total_orders   = Order.all_orders
	 	@total_products = Product.all_products
	 	@total_revenue  = OrderDetail.total_revenue

	end

	def dashboard_2
     @state_1                       = Address.top_state(0)
     @state_2                       = Address.top_state(1)
     @state_3                       = Address.top_state(2)

     @state_1_count                 = Address.top_state_count(0)
     @state_2_count                 = Address.top_state_count(1)
     @state_3_count                 = Address.top_state_count(2)

     @city_1                        = Address.top_city(0)
     @city_2                        = Address.top_city(1)
     @city_3                        = Address.top_city(2)

     @city_1_count                  = Address.top_city_count(0)
     @city_2_count                  = Address.top_city_count(1)
     @city_3_count                  = Address.top_city_count(2)

     @highest_order_first_name      = OrderDetail.highest_order_first_name
     @highest_order_last_name       = OrderDetail.highest_order_last_name

     @highest_lifetime_user_first   = OrderDetail.highest_lifetime_user_first
     @highest_lifetime_user_last    = OrderDetail.highest_lifetime_user_last
     @highest_lifetime_order_value  = OrderDetail.highest_lifetime_order_value

	   @highest_avg_order_first       = OrderDetail.highest_avg_order_first
	   @highest_avg_order_last        = OrderDetail.highest_avg_order_last
	   @highest_avg_order_value       = OrderDetail.highest_avg_order_value

 #    @most_orders_placed_first      = OrderDetail.most_orders_placed
 #    @most_orders_placed_last       = OrderDetail.most_orders_placed
 #    @most_orders_placed_total      = OrderDetail.most_orders_placed

	end

	def dashboard_3
	
	 	@avg_order_7                   = @revenue_7 / @orders_7
	 	@largest_order_7               = OrderDetail.largest_order(@week)

	 	@avg_order_30                  = @revenue_30 / @orders_30
	 	@largest_order_30              = OrderDetail.largest_order(@month)
                
	 	@avg_order_value               = @total_revenue / @total_orders
		@highest_order_value           = OrderDetail.highest_order_value

  end

end

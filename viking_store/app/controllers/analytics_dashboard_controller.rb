class AnalyticsDashboardController < ApplicationController
	def dashboard

		dashboard_1
		dashboard_2
		dashboard_3
		dashboard_4

	end


	def dashboard_1
		@new_users_7
		@orders_7
		@new_prods_7
		@revenue_7

		@new_users_30
		@orders_30
		@new_prods_30
		@revenue_30

		@total_users
		@total_orders
		@total_products
		@total_revenue

	end

	def dashboard_2
    @state_1
    @state_2
    @state_3

    @state_1_count
    @state_2_count
    @state_3_count

    @city_1
    @city_2
    @city_3

    @city_1_count
    @city_2_count
    @city_3_count

    @highest_order_user_first
    @highest_order_user_second
    @highest_order_value

    @highest_lifetime_user_first
    @highest_lifetime_user_last
    @highest_lifetime_value

    @highest_avg_order_first
    @highest_avg_order_last
    @highest_avg_order_value

	end

	def dashboard_3
		@total_orders_7
		@total_revenue_7
		@avg_order_7
		@largest_order_7

		@total_orders_30
		@total_revenue_30
		@avg_order_30
		@largest_order_30

		@avg_order_number
		@avg_revenue
		@avg_order
		@largest_order

	end

end

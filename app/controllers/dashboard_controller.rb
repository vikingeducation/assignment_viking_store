  class DashboardController < ApplicationController
    def index
      # for the last 7 days: 4 instance vars -
      @week_orders = Order.orders_since(1.week.ago)
      @week_new_users = User.users_since(1.week.ago)
      @week_new_products = Product.products_since(1.week.ago)
      @week_revenue = OrderContent.revenue_since(1.week.ago)

      # month
      @month_orders = Order.orders_since(1.month.ago)
      @month_new_users = User.users_since(1.month.ago)
      @month_new_products = Product.products_since(1.month.ago)
      @month_revenue = OrderContent.revenue_since(1.month.ago)

      # total orders
      @total_orders = Order.orders_since()
      @total_new_users = User.users_since()
      @total_new_products = Product.products_since()
      @total_revenue =  OrderContent.revenue_since()

      # Top geo stats
      @first_state = Billing.top_3_states(1)[0]
      @second_state = Billing.top_3_states(2)[0]
      @third_state = Billing.top_3_states(3)[0]

      @first_state_count = Billing.statecount(1)[1]
      @second_state_count = Billing.statecount(2)[1]
      @third_state_count = Billing.statecount(3)[1]

      @first_city = Billing.top_n_cities(1)[0]
      @second_city = Billing.top_n_cities(2)[0]
      @third_city = Billing.top_n_cities(3)[0]

      @first_city_count = Billing.citycount(1)[1]
      @second_city_count = Billing.citycount(2)[1]
      @third_city_count = Billing.citycount(3)[1]

      # Top user with
      @highest_so_name = OrderContent.return_highest_so[0]
      @highest_so_value = OrderContent.return_highest_so[1]
      @highest_lv_name = OrderContent.return_highest_lv[0]
      @highest_lv_value = OrderContent.return_highest_lv[1]
      @highest_aov =
      @most_orders_placed_name = OrderContent.return_highest_order_count[0]
      @most_orders_placed_value = OrderContent.return_highest_order_count[1]

      # Order stats
      @week_aov = @week_orders/@week_revenue # TODO - fix with AR calls
      @month_aov = @month_orders/@month_revenue
      @total_aov = @total_orders/@total_revenue

      @week_lov = OrderContent.lov_since(1.week.ago)
      @month_lov = OrderContent.lov_since(1.month.ago)
      @total_lov = OrderContent.lov_since()

      #time series
      @last_seven_days_orders = []
      @last_seven_weeks_orders = []
      @last_seven_days_rev = []
      @last_seven_weeks_rev = []
      (0..6).each do |i|
          @last_seven_days_orders << Order.orders_on(Date.today - i.days)
          @last_seven_weeks_orders << Order.orders_in(Time.now.beginning_of_week - i.weeks)
          @last_seven_days_rev << OrderContent.orders_on(Date.today - i.days)
          @last_seven_weeks_rev << OrderContent.orders_in(Time.now.beginning_of_week - i.weeks)
      end
    end # end def
  end # end class

class DashboardController < ApplicationController
  def index
    # for the last 7 days: 4 instance vars -
    @week_orders = Order.orders_during(1.week.ago)
    @week_new_users = User.users_during(1.week.ago)
    @week_new_products = Product.products_during(1.week.ago)
    @week_revenue = OrderContent.revenue_during(1.week.ago)

    # month
    @month_orders = Order.orders_during(1.month.ago)
    @month_new_users = User.users_during(1.month.ago)
    @month_new_products = Product.products_during(1.month.ago)
    @month_revenue = OrderContent.revenue_during(1.month.ago)

    # total orders
    @total_orders = Order.orders_during(10.years.ago) # TODO fix this for all time
    @total_new_users = User.users_during(2.years.ago)
    @total_new_products = Product.products_during(2.years.ago)
    @total_revenue =  OrderContent.revenue_during(10.years.ago)

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
    @highest_so_name = return_highest_so[0]
    @highest_so_value = return_highest_so[1]
    @highest_lv_name = return_highest_lv[0]
    @highest_lv_value = return_highest_lv[1]
    @highest_aov =
    @most_orders_placed = return_highest_order_count

    # Order stats
    @week_aov = @week_orders/@week_revenue # TODO fix with AR calls
    @month_aov = @month_orders/@month_revenue
    @total_aov = @total_orders/@total_revenue

    @week_lov = lov_during(1.week.ago)
    @month_lov = lov_during(1.month.ago)
    @total_lov =lov_during(10.years.ago)

  end

end

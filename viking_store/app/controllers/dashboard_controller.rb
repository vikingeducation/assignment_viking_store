class DashboardController < ApplicationController
  def index
  	week = 1.week.ago
  	month = 1.month.ago
  	all = 100.years.ago

    @user_7 = User.user(week)
    @orders_7 = Order.orders(week)
    @products_7 = Product.products(week)
    @revenue_7 = OrderContent.revenue(week)

    @user_30 = User.user(month)
    @orders_30 = Order.orders(month)
    @products_30 = Product.products(month)
    @revenue_30 = OrderContent.revenue(month)

    @user_all = User.all_time
    @orders_all = Order.orders(all)
    @products_all = Product.products(all)
    @revenue_all = OrderContent.revenue(all)    

    @state1 = Address.get_top_state(0)
    @state2 = Address.get_top_state(1)
    @state3 = Address.get_top_state(2)

    @state_count1 = Address.get_top_count(0)
    @state_count2 = Address.get_top_count(1)
    @state_count3 = Address.get_top_count(2)

    @city1 = Address.get_top_city(0)
    @city2 = Address.get_top_city(1)
    @city3 = Address.get_top_city(2)

    @city_count1 = Address.get_top_city_count(0)
    @city_count2 = Address.get_top_city_count(1)
    @city_count3 = Address.get_top_city_count(2)

    @highest_first = OrderContent.highest_first
    @highest_last = OrderContent.highest_last
    @highest_single_value = OrderContent.highest_single_value

    @highest_lifetime = OrderContent.highest_lifetime
    @highest_lifetime_first = OrderContent.highest_lifetime_first
    @highest_lifetime_last = OrderContent.highest_lifetime_last
  end
end

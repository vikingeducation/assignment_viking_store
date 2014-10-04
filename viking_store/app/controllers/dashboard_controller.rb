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

    @user_all = User.user(all)
    @orders_all = Order.orders(all)
    @products_all = Product.products(all)
    @revenue_all = OrderContent.revenue(all)    
    
  end
end

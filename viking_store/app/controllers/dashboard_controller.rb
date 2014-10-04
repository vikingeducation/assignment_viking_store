class DashboardController < ApplicationController
  def index
    @user_7 = User.user_7
    @orders_last_week = Order.orders_last_week
    @products_from_last_week = Product.products_from_last_week
  end
end

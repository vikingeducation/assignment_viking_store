class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart

  def set_cart
      @order = Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
      @order = Order.create
      session[:order_id] = @order.id
  end

end

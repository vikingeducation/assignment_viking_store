class OrdersController < ApplicationController
	def index
    @orders = Order.all
    @user   = User.find(params[:user_id]) if params[:user_id]
	end

	def new
    @order = Order.new
    @user = User.find(params[:user_id])
	end

	def show
  @order = Order.find(params[:id])
	@user   = @order.user
	end

end

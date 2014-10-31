class OrdersController < ApplicationController
	def index
    @orders = Order.all
    @user   = User.find(params[:user_id]) if params[:user_id]
	end

	def new
    @order = Order.new
    @user  = User.find(params[:user_id])
	end

	def create
		@order = Order.new(orders_params)
		@user  = @order.user

		if @order.save
			flash[:success] = "The order was created"
			redirect_to order_path(@order)
		else
			flash[:error] = "Ooops, something went wrong"
			render :new
		end
	end

	def edit
		@order = Order.find(params[:id])
		@user  = @order.user 
	end

	def show
	  @order = Order.find(params[:id])
		@user  = @order.user
	end



end

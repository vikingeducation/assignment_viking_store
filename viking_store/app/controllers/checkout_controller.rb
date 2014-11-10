class CheckoutController < ApplicationController

  layout 'store'

	def edit
    @current_user = current_user
    @cart_contents = OrderDetail.where(order_id: (@current_user.orders.where(:checked_out => false)[0]).id)
	end
  
  def update
  	@current_user = current_user
    @cart_contents = OrderDetail.where(order_id: (@current_user.orders.where(:checked_out => false)[0]).id)
    redirect_to :action => 'edit'
  end
end

class CheckoutController < ApplicationController

  layout 'store'

	def edit
    @current_user = current_user

    if signed_in_user? && has_cart?
      @cart = OrderDetail.where(order_id: (@current_user.orders.where(:checked_out => false)[0]).id)
    else
      @cart = session[:cart]
    end
	end
  
  def update
  	@current_user = current_user
    @cart_contents = OrderDetail.where(order_id: (@current_user.orders.where(:checked_out => false)[0]).id)
    redirect_to :action => 'edit'
  end

  private

  def has_cart?
    OrderDetail.where(order_id: (@current_user.orders.find_by(checked_out: false))).exists?
  end

  # def create_cart
  #   o = Order.new
  #   o.user_id = current_user.id
  #   o.billing_address_id = current_user.default_billing_id
  #   o.shipping_address_id = current_user.default_shipping_id
  #   o.save
    
  #   id = o.id
    
  #   session[:cart].each do |product, quantity|
  #     o = OrderDetail.new
  #     o.order_id = id
  #     o.quantity = quantity
  #     o.product_id = product
  #     o.price = product.price * quantity
  #     o.save
  #   end
  # end

  # def update_cart
  #   cart = OrderDetail.where(order_id: (@current_user.orders.find_by(checked_out: false)))

  #   cart.each do |item|
  #     session[:cart].each do |product, quantity|
  #       if product.to_i == item.product_id
  #         item.quantity = quantity.to_i
  #         item.save
  #       end
  #     end
  #   end
  # end



end

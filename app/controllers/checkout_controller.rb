class CheckoutController < ApplicationController

  def create
    cart = Cart.find_by(user_id: current_user.id)
    checkout = Checkout.new(cart)

    if checkout.process
      redirect_to confirmation_page_path
    else
      render :something_else
    end
  end

end

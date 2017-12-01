class CheckoutController < ApplicationController

  def create
    cart = Cart.find_by(user_id: current_user.id)
    checkout = Checkout.new(cart)

    if checkout.process
      # redirect_to confirmation_page_path
      redirect_to root_path, notice: "YAY. The order was created."
    else
      # render :something_else
      redirect_to root_path, notice: "Aw CRAP. Something failed."
    end
  end

end


# MENTOR NOTES
# class CheckoutController
#   def create
#     checkout = Checkout.new(Cart.find_by_user_id(user_id))

#     if order = checkout.process
#       YAY IT WORKED
#     else
#       OH SHIT
#     end
#   end

# end

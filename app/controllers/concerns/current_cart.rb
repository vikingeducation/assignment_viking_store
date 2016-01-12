module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    @cart = Order.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Order.create
    session[:cart_id] = @cart.id
  end
end

module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    @cart = Order.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Order.create
    session[:cart_id] = @cart.id
  end

  def combine_carts(user)
    user = current_user
    user_carts = user.orders.where(checkout_date: nil)
    session_cart = Order.where(id: session[:cart_id]).first

    if session_cart && session_cart.user_id.nil? && user_carts.present?
      session_cart.user_id = current_user.id
      session_cart.save

      user_carts.each do |cart|
        cart.order_contents.each do |item|
          moved_item = session_cart.add_product(item.product_id, item.quantity)
          moved_item.save
        end
      end

      user_carts.destroy_all

    elsif user_carts.present?
      session[:cart_id] = user_carts.first.id
    end
  end
end

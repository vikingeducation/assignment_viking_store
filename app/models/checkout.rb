class Checkout

  def initialize(cart)
    @cart = cart
  end

  def process
    order = create_order(@cart)
    if create_order_items(order)
      cart.destroy
    end
    order
  end

private

  attr_reader :cart

  def create_order(cart)
    Order.create!({
      user_id: cart.user_id
      #shipping_address: cart.user.shipping_address??
      #billing_address: cart.user.billing_address??
    })
  end

  def create_order_items(order)
    cart.cart_items.each do |item|
      OrderItem.create!({
        order_id: order.id,
        qty: item.qty,
        product_id: item.product.id
        # price: item.product.price
      })
    end
  end

end

# MENTOR NOTES

# ADD DELEGATES to the user.cart.items so it can be user.cart_items

# class Checkout

#   def initialize(cart)
#     @cart = cart
#     @order = Order.new(order_params)
#   end

#   def process
#     if create_order_items(order)
#       cart.destroy #assuming dependent: :destroy on items
#     end
#     return order
#   end

#   private

#   attr_reader :cart, :order

#   def order_params
#     { user_id: cart.user_id }
#   end

#   def create_order_items(order)
#     cart.cart_items do |cart_item|
#       order.order_items.create(order_item_params(cart_item))
#     end
#   end

#   def order_item_params(cart_item)
#     { price: cart_item.product_price,
#       product_id: cart_item.product_id,
#       qty: cart_item.qty
#     }
#   end
# end

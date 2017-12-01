module UsersHelper

  def has_orders(user)
    " | orders: #{user.orders.count}" if user.orders.count > 0
  end

end

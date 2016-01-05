class Admin::OrderContentsController < ApplicationController
  before_action :set_user_and_order

  def create
    # TODO: If a valid Product ID is sent, make sure a valid Quantity is sent too
    # TODO: Adding products to an order form with any duplication adds quantities together.
    # TODO: If mostly valid IDs are sent but one fails, cancel the whole operation with an error
    values = []

    params[:items].each do |key, value|
      unless value[:product_id].empty?
        product_id = value[:product_id].to_i
        quantity = value[:quantity].to_i
        price = Product.find(product_id).price

        values << { product_id: product_id, quantity: quantity, price: price }
      end
    end

    if @order.order_contents.create(values)
      redirect_to admin_user_order_url(@user, @order), notice: "New items successfully added to order."
    else
      redirect_to edit_admin_user_order_url(@user, @order), alert: "There was an error while adding your items to your order."
    end
  end

  def update
    if @order.order_contents.update(update_items_params.keys, update_items_params.values)
      # TODO: remove items with quantity of zero
      redirect_to admin_user_order_url(@user, @order), notice: "Order contents successfully updated."
    else
      redirect_to edit_admin_user_order_url(@user, @order), alert: "There was an error processing your request."
    end
  end

  def destroy
    @item = @order.order_contents.find(params[:id])
    if @item.destroy
      redirect_to admin_user_order_url(@user, @order), notice: "Item successfully removed from cart."
    else
      redirect_to admin_user_order_url(@user, @order), alert: "Item could not be removed from cart."
    end
  end

  private

  def set_user_and_order
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:order_id])
  end

  def update_items_params
    params.require(:items)
  end

end
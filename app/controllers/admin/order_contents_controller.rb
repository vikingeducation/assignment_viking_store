class Admin::OrderContentsController < ApplicationController
  before_action :set_user_and_order

  def update
    if @order.order_contents.update(update_items_params.keys, update_items_params.values)
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
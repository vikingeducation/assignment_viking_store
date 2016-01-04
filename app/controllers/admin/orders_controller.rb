class Admin::OrdersController < ApplicationController
  layout 'admin'
  before_action :set_user, except: [:all_orders]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_params

  def all_orders
    # TODO: add pagination
    @orders = Order.all.limit(100)
  end

  def index
    @orders = @user.orders
  end

  def show
  end

  def new
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def invalid_params
    redirect_to admin_orders_path, alert: 'The page you attempted to view could not be found.'
  end
end

class Admin::OrdersController < ApplicationController
  layout 'admin'
  before_action :set_user, except: [:all_orders]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def all_orders
    @orders = Order.all
  end

  def index
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
end

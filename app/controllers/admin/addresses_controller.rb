class Admin::AddressesController < ApplicationController
  layout 'admin'
  before_action :set_user, only: [:index, :show]
  before_action :set_address, only: [:show]

  def all_addresses
    @addresses = Address.all
  end

  def index
    @addresses = @user.addresses
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
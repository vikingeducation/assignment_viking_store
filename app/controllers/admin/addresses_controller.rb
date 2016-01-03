class Admin::AddressesController < ApplicationController
  layout 'admin'

  def index
    @user = User.find(params[:user_id])
    @addresses = @user.addresses
  end
end
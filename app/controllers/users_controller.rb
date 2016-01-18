class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
    @user.addresses.build
    @user.addresses.build
  end

  def create

  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number, {:addresses_attributes => [:street_address, :secondary_address, :city_name, :state_id, :zip_code]})
  end
end

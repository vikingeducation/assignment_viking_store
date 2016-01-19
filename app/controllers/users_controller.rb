class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
    @user.addresses.build
    @user.addresses.build
  end

  def create
    @user = User.new(user_params)

    @user.addresses.each_with_index do |address, index|
      city = City.find_or_create_by(name: params[:user][:addresses_attributes][index.to_s][:city_name])
      address.city_id = city.id
    end

    if @user.save
      redirect_to products_index_url, notice: "You successfully registered!"
    else
      flash.now[:alert] = "There was a problem submitting your form.  See below for errors."
      render :new
    end
  end

  # TODO: change edit, show, delete path to not have user_id param
  def edit
    @user.addresses.build
  end

  def update
    @user.update(user_params)

    @user.addresses.each_with_index do |address, index|
      city = City.find_or_create_by(name: params[:user][:addresses_attributes][index.to_s][:city_name])
      address.city_id = city.id
    end

    if @user.save
      redirect_to products_index_url, notice: "Your user information was successfully updated!"
    else
      flash.now[:alert] = "There was a problem submitting your form.  See below for errors."
      render :edit
    end
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number, :billing_id, :shipping_id, { :addresses_attributes => [:id, :street_address, :secondary_address, :state_id, :zip_code, :_destroy] })
  end
end

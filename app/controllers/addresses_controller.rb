class AddressesController < ApplicationController

  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        redirect_to @address, notice: 'Address was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        redirect_to @address, notice: 'Address was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      redirect_to addresss_url, notice: 'Address was successfully destroyed.'
    end
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:address_type_id, :user_id, :default, :street_1, :street_2, :city, :state_id, :zip )
    end
end


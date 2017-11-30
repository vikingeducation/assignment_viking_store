class AddressTypesController < ApplicationController

  before_action :set_address_type, only: [:show, :edit, :update, :destroy]

  def index
    @address_types = AddressType.all.order(:name)
  end

  def show
  end

  def new
    @address_type = AddressType.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_address_type
    @address_type = AddressType.find(params[:id])
  end

  def address_type_params
    params.require(:address_type).permit(:name)
  end
end

class AddressesController < ApplicationController
	def index
		@addresses = Address.all
		@user = User.find(params[:user_id]) if params[:user_id]
	end

	def new
  	@address = Address.new
  	@user = User.find(params[:user_id])
  end

  def create

  end
  
  def show
  	@address = Address.find(params[:id])
  	@user = @address.user
  end

  def edit
    @address = Address.find(params[:id])
    @user = @address.user
  end
  
  def update

  end

  def destroy

  end

  private

  def address_params
  	params.require(:address).permit(:street_address, :secondary_address, :city, :state, :zip, :user_id)
  end


end

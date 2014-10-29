class AddressesController < ApplicationController
	def index
		@addresses = Address.all
		@user = User.find(params[:user_id]) if params[:user_id]
	end
  
  def show
  	
  end

  def edit
    @address = Address.find(params[:id])
    @user = @address.user
  end

end

class Admin::AddressesController < ApplicationController
	def index
		@addresses = Address.all
		@user = User.find(params[:user_id]) if params[:user_id]
	end

	def new
  	@address = Address.new
  	@user = User.find(params[:user_id])
    @state_options = Address.all.map{|x| [ x.state, x.id ] } 
  end

  def create
  	@address = Address.find(params[:id])

  	if @addres.create(address_params)
  		flash[:success] = "Address was created"
  		redirect_to action: :index
  	else
  		flash[:error] = "Something happened, couldn't create address"
  		render :new
  	end
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
    @address = Address.find(params[:id])
    @user = @address.user

    if @address.update(address_params)
    	flash[:success] = "Address was updated successfully"
    	redirect_to user_path(@user)
    else
    	flash.now[:error] = "Woops, something went wrong"
    	render :edit
    end
  end

  def destroy
    session[:return_to] ||= request.referer
    if Address.find(params[:id]).destroy
      flash[:success] = "What address?"
      redirect_to action: :index
    else
      flash[:error] = "Oops, couldn't delete"
      redirect_to session.delete[:return_to]
    end
  end

  private

  def address_params
  	params.require(:address).permit(:street_address, :secondary_address, :city, :state, :zip, :user_id)
  end


end

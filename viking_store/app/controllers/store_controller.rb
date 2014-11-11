class StoreController < ApplicationController
	
	layout 'store'

	def index
    if params[:category_id]
      @products = Product.where(:category_id => params[:category_id])
    else
    	@products = Product.all
    end
  end

  def show
    # will be for store products
  end

  def signup
  	@user = User.new
  end

  def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "Thank you for making an account!"
			redirect_to root_path
		else
			flash.now[:error] = "Woops, I guess he's not coole enough. Didn't save"
			render 'signup'
		end
	end


  private

  def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
	end

end

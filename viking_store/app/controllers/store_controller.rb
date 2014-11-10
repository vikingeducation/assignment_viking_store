class StoreController < ApplicationController
	
	layout 'store'

	def index
    if params[:category_id]
      @products = Product.where(:category_id => params[:category_id])
    else
    	@products = Product.all
    end
  end

  def login
    # login form
  end

  def signup
  	@user = User.new
  end

  def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "User was created!"
			redirect_to root_path
		else
			flash.now[:error] = "Woops, I guess he's not coole enough. Didn't save"
			render 'signup'
		end
	end

  def attempt_login
    if params[:last_name].present? && params[:email].present?
      found_user = User.where(:last_name => params[:last_name].capitalize).first
      if found_user.email == params[:email]
      	authorized_user = found_user
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = found_user.id
      flash[:success] = "You are now logged in"
      redirect_to(:action => 'index')
    else
      flash[:error] = "Invalid last name and/or email"
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    flash[:success] = "You have been logged out"
    redirect_to(:action => "login")
  end

  private

  def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
	end

end

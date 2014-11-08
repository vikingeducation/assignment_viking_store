class StoreController < ApplicationController
	
	layout 'store'

	def index
    # display text & links
    @products = Product.all
  end

  def login
    # login form
  end

  def signup
    #sign up form
  end

  def attempt_login
    if params[:last_name].present? && params[:email].present?
      found_user = AdminUser.where(:last_name => params[:last_name]).first
    end
    if found_user
      # mark user as logged in
      session[:user_id] = found_user.id
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid last name/email combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

end

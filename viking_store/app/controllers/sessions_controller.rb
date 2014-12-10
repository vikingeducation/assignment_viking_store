class SessionsController < ApplicationController

  layout 'store'

	def new
	end

	def create
		if params[:last_name].present? && params[:email].present?
			found_user = User.where(:email => params[:email]).first
				if found_user
					sign_in found_user
					flash[:success] = "Thanks for logging in!"
					redirect_to root_path
				else
					flash[:error] = "You could not be signed in. Please try again."
					render 'new'
				end
		end
	end

  def destroy
		session.delete(:current_user_id)
		current_user = nil
		session.delete(:cart)
		flash[:success] = "You have signed out successfully."
		redirect_to root_path
  end

end

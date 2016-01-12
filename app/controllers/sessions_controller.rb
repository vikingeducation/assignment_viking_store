class SessionsController < ApplicationController

  def new
  end

  # sign-in
  def create
    user = User.find_by_email(params[:email])
    if user
      sign_in(user)
      redirect_to root_url, notice: "Thanks for signing in!"
    else
      flash.now[:alert] = "We could not sign you in due to an error."
      render :new
    end
  end

  # sign-out
  def destroy
    if sign_out
      redirect_to root_url, notice: "You have successfully signed out."
    else
      redirect_to root_url, alert: "Angry robots have prevented you from signing out.  You're stuck here forever."
    end
  end
end
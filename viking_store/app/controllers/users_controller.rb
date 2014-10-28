class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user       = User.find(params[:id])
		@billing    = Address.find(@user.default_billing_id)
		@shipping   = Address.find(@user.default_shipping_id)
	end


end

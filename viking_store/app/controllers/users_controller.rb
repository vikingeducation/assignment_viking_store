class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user       = User.find(params[:id])
		@billing    = Address.find(@user.default_billing_id)
		@shipping   = Address.find(@user.default_shipping_id)
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end


end

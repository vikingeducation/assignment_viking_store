class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "User was created!"
			redirect_to user_path(@user)
		else
			flash.now[:error] = "Woops, I guess he's not coole enough. Didn't save"
			render :new
		end
	end

	def show
		@user       = User.find(params[:id])
		@billing    = Address.find(@user.default_billing_id)
		@shipping   = Address.find(@user.default_shipping_id)
	end

	

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:success] = "User was updated successfully!"
			redirect_to user_path(@user)
		else
			flash.now[:error] = "That guy didn't save..weird"
			render :edit
		end
	end


end

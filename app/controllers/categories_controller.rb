class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		render 'categories_index'
	end

	def show
		@category = Category.find(params[:id])
		@category_products = @category.products.all
		render 'one_category'
	end

	def new
		@category = Category.new(name: params[:name])
		render 'new_category'
	end

	def create
		@category = Category.new(whitelisted_category_params)
		if @category.save
			redirect_to categories_path
			flash[:success] = "Congratulations on creating a new account!" # how to make work?
		else
			render 'new_category'
		end
	end

	def edit
		@category = Category.find(params[:id])
		render 'edit_category'
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(whitelisted_category_params)
			flash[:success] = "Congratulations on creating a new account!" # how to make work?
			redirect_to categories_path
		else
			render 'edit_category'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.delete
		redirect_to categories_path
	end

	private
	def whitelisted_category_params
		params.require(:category).permit(:name)
  end

end

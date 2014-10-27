class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
    	flash[:success] = "Category added!"
    	redirect_to categories_path
    else
    	flash.now[:error] = "Uh oh, something went wrong with that category"
    	render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
  	@category = Category.find(params[:id])

  	if @category.update(category_params)
  		flash[:success] = "Category has been updated!"
  		redirect_to category_path(@category)
  	else
  		flash.now[:error] = "Oops, something went wrong"
  		render :edit
  	end
  end



  private

  def category_params
  	params.require(:category).permit(:title)
  end

end

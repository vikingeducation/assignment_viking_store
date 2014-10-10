class ProductsController < ApplicationController
  
  def index
  	@products = Product.all
  	render 'products_index'
  end

  def show
  end

  def new
  	@product = Product.new(name: params[:name])
  	render 'new_product'
  end

  def create
	  @product = Product.new(whitelisted_product_params)
		if @product.save
			redirect_to products_path
			flash[:success] = "Congratulations on creating a new account!" # how to make work?
		else
			render 'new_category'
		end
  end

  def edit
  end

  def whitelisted_product_params
  	params.require(:product).permit(:name,:price, :category_id)
  end

end

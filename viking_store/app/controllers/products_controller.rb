class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

  def new
  	@product = Product.new
  end

  def show 
  	@product = Product.find(params[:id])

  	@product_order_count = @product.orders.count
  	@product_cart_count  = @product.orders.where(:checked_out => false).count
  end

  def edit
    @product = Product.find(params[:id])
  end
 
  

end

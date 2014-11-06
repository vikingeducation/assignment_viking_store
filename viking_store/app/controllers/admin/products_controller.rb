class Admin::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

  def new
  	@product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
    	flash[:success] = "Prodcut added"
    	redirect_to action: :index
    else
    	flash.now[:error] = "Hmm...product was probably wack"
    	render :new
    end
  end

  def show 
  	@product = Product.find(params[:id])

  	@product_order_count = @product.orders.count
  	@product_cart_count  = @product.orders.where(:checked_out => false).count
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])

  	if @product.update(product_params)
  		flash[:success] = "Product has been update"
  		redirect_to admin_product_path(@product)
  	else
  		flash.now[:error] = "Whoa, sorry but it wasn't updated"
  		render :edit
  	end
  end
 
  def destroy
    session[:return_to] ||= request.referer
    if Product.find(params[:id]).destroy
    	flash[:success] = "Product was deleted"
    	redirect_to action: :index
    else
    	flash[:error] = "Uh oh, couldn't delete. Weird."
    	redirect_to session.delete[:return_to]
    end
  end
  
  private

  def product_params
  	params.require(:product).permit(:category_id, :title, :price)
  end

end

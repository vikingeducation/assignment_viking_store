class CartsController < ApplicationController
  before_action :set_return_path, only: [:create, :destroy]

  layout 'store'

  def create
  	session[:cart] ||= {}
  	item = params[:item]

  	if Product.exists?(item) && session[:cart][item]
  		session[:cart][item] =+ 1
  		flash[:success] = "#{Product.find(item).title} added to cart"
  	elsif Product.exists?(item)
  		session[:cart][item] = 1
  		flash[:success] = "#{Product.find(item).title} added to cart"
  	else
  		flash[:error] = "Invalid product"
  	end

  	redirect_to session.delete(:return_to)
  end

  def edit
  	@cart = session[:cart]
  	@total = 0
  	if @cart
  		@cart.each do |product_id, quantity|
  			@total += (Product.find(product_id).price * quantity)
  		end
  	end
  end

  def update
    @cart = session[:cart]
    @total = 0

    params[:order].each do |product_id, quantity|
    	quantity = quantity.to_i

    	session[:cart][product_id] = quantity
    	session[:cart].delete(product_id) if quantity == ("0" || "")
    	@total += (Product.find(product_id).price * quantity)
    end

    if params[:remove]

    	params[:remove].each do |product_id, _true|
    		session[:cart].delete(product_id)
    	end
    end

    flash.now[:success] = "Product quantity has been upated."
    render :edit
  end

  def destroy
  	session.delete(:cart)
  	flassh[:success] = "Cart has been emptied"
  	redirect_to root_path
  end
end

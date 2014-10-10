class ProductsController < ApplicationController
  
  def index
  	@products = Product.all
  	render 'products_index'
  end

end

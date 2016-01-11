class ProductsController < ApplicationController
  def index
    @category_options = Category.pluck(:name, :id)
    filter_category = Category.where(id: params[:filter_category_id]).first
    @filter_category = filter_category ? "Filtered by #{filter_category.name.titleize}" : nil

    @products = Product.filter_category(filter_category)

  end
end

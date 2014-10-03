class AddProductRefToOrderDetails < ActiveRecord::Migration
  def change
  	add_reference :order_details, :product
  end
end

class AddOrderRefToOrderDetails < ActiveRecord::Migration
  def change
  	add_reference :order_details, :order
  end
end

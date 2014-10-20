class FixOrderDetailsAgain < ActiveRecord::Migration
  def change
  	remove_column :order_details, :price
  	remove_column :order_details, :checked_out
  	add_column :order_details, :product_id, :integer
  end
end

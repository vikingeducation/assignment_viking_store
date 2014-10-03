class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
    	# method for creating order_id ref
    	# method for creating product_id ref
    	t.string :price
    	t.string :quantity

      t.timestamps
    end
  end
end

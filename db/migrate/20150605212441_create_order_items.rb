class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
    	t.integer :product_id, :null => false
    	t.integer :order_id, :null => false
    	t.integer :quantity, :null => false, :default => 1
    	
      t.timestamps null: false
    end
  end
end

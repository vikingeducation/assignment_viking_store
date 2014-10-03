class CreateOrderContents < ActiveRecord::Migration
  def change
    create_table :order_contents do |t|
      t.integer :order_id, :null => false
      t.integer :product_id, :null => false
      t.integer :quantity, :null => false

      t.timestamps
    end
  end
end

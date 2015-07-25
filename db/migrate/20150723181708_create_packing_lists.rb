class CreatePackingLists < ActiveRecord::Migration
  def change
    create_table :packing_lists do |t|
      t.integer :product_id, null: false
      t.integer :order_id, null: false
      t.integer :quantity, null: false
      
      t.timestamps null: false
    end
  end
end

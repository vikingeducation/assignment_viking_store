class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :product_id, :null => false
      t.integer :shopping_cart_id, :null => false

      t.timestamps
    end
  end
end

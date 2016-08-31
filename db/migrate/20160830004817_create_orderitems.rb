class CreateOrderitems < ActiveRecord::Migration[5.0]
  def change
    create_table :orderitems do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end

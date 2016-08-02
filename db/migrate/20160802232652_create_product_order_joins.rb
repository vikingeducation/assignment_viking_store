class CreateProductOrderJoins < ActiveRecord::Migration
  def change
    create_table :product_order_joins do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :product_amount
      t.timestamps null: false
    end
  end
end

class CreateOrderContents < ActiveRecord::Migration[5.0]
  def change
    create_table :order_contents do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end

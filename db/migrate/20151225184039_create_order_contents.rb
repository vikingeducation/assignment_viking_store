class CreateOrderContents < ActiveRecord::Migration
  def change
    create_table :order_contents do |t|
      t.references :product, index: true, foreign_key: true, null: false
      t.integer :quantity, null: false, default: 1
      t.references :order, index: true, foreign_key: true, null: false
      t.decimal :price, null: false

      t.timestamps null: false
    end
  end
end

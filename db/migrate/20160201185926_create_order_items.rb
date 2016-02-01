class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true, null: false
      t.references :product, null: false
      t.integer :quantity, null: false

      t.timestamps null: false
    end
  end
end

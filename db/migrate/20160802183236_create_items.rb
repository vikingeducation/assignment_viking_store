class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity, default: 0
      t.integer :unit_price

      t.timestamps null: false
    end
  end
end

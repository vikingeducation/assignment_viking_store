class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :order_id, null: false, index: true
      t.integer :product_id, null: false, index: true
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
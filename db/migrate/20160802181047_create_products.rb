class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, null: false
      t.string :sku, null: false
      t.integer :category_id, null: false
      t.integer :amt_in_stock, null: false
      t.timestamps null: false
    end
  end
end

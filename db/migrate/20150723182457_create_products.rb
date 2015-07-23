class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :title, null: false
      t.text :description
      t.float :price, null:false
      t.string :sku, null:false
      t.integer :category_id
      t.integer :amount_in_stock

      t.timestamps null: false
    end
  end
end

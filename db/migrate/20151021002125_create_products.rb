class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, index: true, unique: true, null: false
      t.text :description
      t.string :sku, index: true, unique: true, null: false
      t.decimal :price, null:false, precision: 8, scale: 2
      t.integer :category_id

      t.timestamps null: false
    end
  end
end

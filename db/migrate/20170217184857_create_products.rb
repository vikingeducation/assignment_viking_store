class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :category_id, null: false, index: true
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, precision: 6, scale: 2, null: false
      t.string :SKU, null: false  

      t.timestamps
    end
  end
end
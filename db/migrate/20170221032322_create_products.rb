class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.text :description
      t.float :price
      t.string :sku, null:false
      t.integer :quantity, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

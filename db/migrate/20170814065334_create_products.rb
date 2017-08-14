class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :sku
      t.integer :price
      t.integer :stock
      t.references :product_category, foreign_key: true

      t.timestamps
    end
  end
end

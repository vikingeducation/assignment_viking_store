class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, precision: 8, scale: 2
      t.string :sku
      t.integer :quantity
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

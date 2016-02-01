class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :sku, null: false
      t.decimal :price, null: false, precision: 8, scale: 2, default: 0.00
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :sku, null: false, unique: true

      t.timestamps
    end
  end
end

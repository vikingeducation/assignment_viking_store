class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :sku
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :product_category_id

      t.timestamps null: false
    end
  end
end

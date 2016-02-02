class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.float :price, null: false
      t.string :sku, null: false, unique: true
      t.integer :category_id

      t.timestamps null: false
    end
    add_foreign_key :products, :categories, index: true
  end
end
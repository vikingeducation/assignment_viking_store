class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.float :price, null: false
      t.string :sku, null: false, unique: true
      # add category_id to product as foreign key
      add_foreign_key :products, :categories, index: true

      t.timestamps null: false
    end
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :title, null: false
      t.text :description
      t.float :price, null: false
      t.integer :sku, null: false

      t.timestamps null: false
    end
  end
end

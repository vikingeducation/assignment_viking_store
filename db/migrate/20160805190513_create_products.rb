class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.integer :price, null: false
      t.integer :sku, null: false
      t.integer :category_id

      t.timestamps
    end
  end
end

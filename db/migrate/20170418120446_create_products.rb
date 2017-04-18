class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.float :price, :null => false
      t.string :sku_number
      t.integer :category_id, :null => false

      t.timestamps
    end
  end
end

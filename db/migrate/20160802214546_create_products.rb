class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :sku_num
      t.integer :category_id

      t.timestamps
    end
  end
end

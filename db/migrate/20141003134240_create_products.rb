class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product, :null => :false
      t.string :product_description
      t.integer :category_id
      t.integer :price, :null => :false
      t.integer :sku, :null => :false
      t.timestamps
    end
  end
end
class CreateProductDetails < ActiveRecord::Migration
  def change
    create_table :product_details do |t|

      t.string :title, :null => false
      t.string :description
      t.decimal :price, :null => false
      t.integer :product_category_id, :null => false

      t.timestamps null: false
      
    end
  end
end

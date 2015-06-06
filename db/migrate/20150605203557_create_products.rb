class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :title, :null => false
    	t.text :description
    	t.integer :price, :null => false
    	t.integer :sku, :null => false
    	t.integer :category_id, :null => false

      t.timestamps null: false
    end
  end
end

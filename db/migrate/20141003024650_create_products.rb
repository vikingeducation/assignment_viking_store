class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, :null => false
      t.string :category, :default => 'General'
      t.text :description
      t.integer :sku, :null => false
      t.float :price, :null => false

      t.timestamps
    end
  end
end

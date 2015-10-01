class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku, :null => false, :unique => true, :index => true
      t.integer :product_id, :null => false

      t.timestamps null: false
    end
  end
end

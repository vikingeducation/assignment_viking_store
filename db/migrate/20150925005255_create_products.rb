class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :limit => 32
      t.text :description
      t.integer :units
      t.string :sku

      t.index :sku, :unique => true

      t.timestamps null: false
    end
  end
end

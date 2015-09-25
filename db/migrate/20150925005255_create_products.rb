class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :limit => 32
      t.text :description
      t.integer :units
      t.string :sku
      t.decimal :price, :precision => 9, :scale => 2, :default => 0.00

      t.index :sku, :unique => true

      t.timestamps null: false
    end
  end
end

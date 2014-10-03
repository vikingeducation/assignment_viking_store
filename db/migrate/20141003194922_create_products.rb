class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id

      t.string :name
      t.text :description
      t.integer :sku, null: false, index: true, unique: true
      t.decimal :price, null: false # use decimal instead of float for money!

      t.timestamps
    end
  end
end

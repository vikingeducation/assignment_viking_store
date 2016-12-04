class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desription
      t.integer :sku
      t.decimal :price
      t.integer :category_id

      t.timestamps
    end
  end
end

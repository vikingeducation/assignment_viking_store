class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :category_id, null: false
      t.string  :name,       null: false
      t.integer :sku,        null: false
      t.decimal :price,      null: false
      t.text    :description

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :sku, unique: true
  end
end

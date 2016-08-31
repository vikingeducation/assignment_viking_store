class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :units, null: false, default: 1
      t.string :sku_number, null: false, unique: true

      t.timestamps
    end
  end
end

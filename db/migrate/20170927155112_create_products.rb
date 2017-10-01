class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.float :price
      t.string :sku
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

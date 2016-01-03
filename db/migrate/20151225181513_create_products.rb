class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description
      t.references :category, index: true, foreign_key: true
      t.decimal :price, null: false
      t.string :sku

      t.timestamps null: false
    end
  end
end

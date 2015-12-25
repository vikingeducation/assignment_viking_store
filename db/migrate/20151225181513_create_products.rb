class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :description
      t.references :category, index: true, foreign_key: true
      t.decimal :price, null: false
      t.string :SKU_number

      t.timestamps null: false
    end
  end
end

class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.string :sku
      t.integer :category_id
      # t.references :category
      t.timestamps
    end
  end
end

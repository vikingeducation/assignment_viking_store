class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 5, scale: 2
      t.string :sku

      t.timestamps
    end

    add_reference :products, :category, foreign_key: true
  end
end


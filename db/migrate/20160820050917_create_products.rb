class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text   :description
      t.integer :SKU_number
      t.integer :price

      t.timestamps
    end

    add_reference :products, :category, index: true
    add_foreign_key :products, :categories
  end
end

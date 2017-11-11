class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.string :sku
      t.timestamps
    end

    add_column :categories, :description, :text
    
  end
end

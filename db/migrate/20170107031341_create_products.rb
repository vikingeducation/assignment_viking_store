class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :category
      t.string :name, null:false
      t.string :sku, null:false

      t.timestamps
    end
  end
end

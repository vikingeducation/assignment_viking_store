class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.float :price, null: false
      t.string :sku, null: false
      t.integer :group_id, null: false

      t.timestamps null: false
    end
  end
end


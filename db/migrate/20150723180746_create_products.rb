class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name,        null: false
      t.integer  :category_id
      t.decimal :price, precision: 5, scale: 2, null: false
      t.text  :description, null: false
      t.integer :stock,       null: false

      t.timestamps null: false
    end
  end
end

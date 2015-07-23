class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name,        null: false
      t.string  :category,
      t.text  :description, null: false
      t.decimal, precision: 5, scale: 2, :price, null: false
      t.integer :stock,       null: false

      t.timestamps null: false
    end
  end
end

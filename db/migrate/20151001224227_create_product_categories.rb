class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name, :null => false, :unique => true
      t.string :description

      t.timestamps null: false
    end
  end
end

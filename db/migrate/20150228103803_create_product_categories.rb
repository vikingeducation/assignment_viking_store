class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      i.integer :product_id
      i.integer :category_id

      t.timestamps null: false
    end
  end
end

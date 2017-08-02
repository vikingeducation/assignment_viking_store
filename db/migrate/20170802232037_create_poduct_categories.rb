class CreatePoductCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :poduct_categories do |t|
      t.string :description

      t.timestamps
    end
  end
end

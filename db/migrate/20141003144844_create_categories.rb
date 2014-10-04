class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :category_id, :null => :false
      t.string :category_name, :null => :false
      t.string :category_description
      t.timestamps
    end
  end
end
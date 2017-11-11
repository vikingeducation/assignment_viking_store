class AddForeignKeyToProducts < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :category_id, :categories
  end
end

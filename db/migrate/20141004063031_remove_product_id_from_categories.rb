class RemoveProductIdFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :product_id
  end
end

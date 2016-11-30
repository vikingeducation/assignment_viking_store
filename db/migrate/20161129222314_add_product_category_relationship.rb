class AddProductCategoryRelationship < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :categories, :foreign_key => true
  end
end

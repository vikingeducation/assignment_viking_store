class ChangeCategoryAttribute < ActiveRecord::Migration
  def change
    remove_column :categories, :type
    add_column :categories, :kind, :string
  end
end

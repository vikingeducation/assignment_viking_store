class RemoveFieldsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :shipping_default, :integer
    remove_column :users, :billing_default, :integer
  end
end

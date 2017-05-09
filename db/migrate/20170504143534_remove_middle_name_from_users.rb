class RemoveMiddleNameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :middle_name, :string
  end
end

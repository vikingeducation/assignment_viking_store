class UpdateUsersNull < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :first_name, :string, :null => false
    change_column :users, :last_name, :string, :null => false
    change_column :users, :email, :string, :null => false
  end
end

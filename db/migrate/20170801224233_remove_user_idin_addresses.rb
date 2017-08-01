class RemoveUserIdinAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :user_id
  end
end

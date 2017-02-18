class AddIndexToUserIdAddresses < ActiveRecord::Migration[5.0]
  def change
    add_index :addresses, :user_id
  end
end

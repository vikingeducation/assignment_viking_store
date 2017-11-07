class RemoveDefaultFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :default
  end
end

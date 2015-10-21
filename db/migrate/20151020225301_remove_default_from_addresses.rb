class RemoveDefaultFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :default
  end
end

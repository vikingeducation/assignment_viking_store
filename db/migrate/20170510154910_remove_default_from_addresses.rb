class RemoveDefaultFromAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :default, :string
  end
end

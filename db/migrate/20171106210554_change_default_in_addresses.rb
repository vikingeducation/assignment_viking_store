class ChangeDefaultInAddresses < ActiveRecord::Migration[5.1]
  def change
    change_column :addresses, :default, :boolean, null: false, default: false
  end
end

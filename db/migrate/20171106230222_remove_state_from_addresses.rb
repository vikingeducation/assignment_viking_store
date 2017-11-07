class RemoveStateFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:addresses, :state, index: true, foreign_key: true)
  end
end

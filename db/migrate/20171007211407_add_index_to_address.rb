class AddIndexToAddress < ActiveRecord::Migration[5.0]
  def change
    add_index :addresses, [:city_id, :state_id, :zip]
  end
end

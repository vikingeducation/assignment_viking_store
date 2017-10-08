class RemoveColumnFromStates < ActiveRecord::Migration[5.0]
  def change
    remove_column :states, :long_name
  end
end

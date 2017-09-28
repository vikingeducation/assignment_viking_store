class ChangeCityAndStateColumnsToReferences < ActiveRecord::Migration[5.1]
  def up
    remove_column :addresses, :city
    remove_column :addresses, :state

    add_reference :addresses, :city, foreign_key: true
    add_reference :addresses, :state, foreign_key: true
  end

  def down
    remove_reference :addresses, :city
    remove_reference :addresses, :state

    add_column :addresses, :city, :string, null: false
    add_column :addresses, :state, :string, null: false
  end
end

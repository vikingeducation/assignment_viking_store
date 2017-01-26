class ChangeAddressingMechanism < ActiveRecord::Migration[5.0]
  def change
  		remove_column :addresses, :state
  		remove_column :addresses, :city

  		add_column :addresses, :state_id, :integer
  		add_foreign_key :addresses, :states

  		add_column :addresses, :city_id, :integer
  		add_foreign_key :addresses, :cities
  end
end

class AddressUpdate < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :city, :integer
    remove_column :addresses, :state
  end
end

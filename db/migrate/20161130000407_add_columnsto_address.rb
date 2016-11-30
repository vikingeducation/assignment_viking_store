class AddColumnstoAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :city, :string, :null => false
    add_column :addresses, :state, :string, :null => false
    add_column :addresses, :country, :string, :null => false
  end
end

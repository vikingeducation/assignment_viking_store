class AddDefaultToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :default, :string
  end
end

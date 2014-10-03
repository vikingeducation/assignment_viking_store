class AddAddressRefToUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :address
  end
end

class AddUserRefToCarts < ActiveRecord::Migration
  def change
  	add_reference :carts, :user
  end
end

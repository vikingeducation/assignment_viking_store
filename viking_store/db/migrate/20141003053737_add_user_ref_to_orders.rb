class AddUserRefToOrders < ActiveRecord::Migration
  def change
  	add_reference :orders, :user
  end
end

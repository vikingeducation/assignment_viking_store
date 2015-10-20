class AddDefaultShipAndBillToUsers < ActiveRecord::Migration
  def change
    add_column :users, :default_ship_address_id, :integer
    add_column :users, :default_bill_address_id, :integer
  end
end

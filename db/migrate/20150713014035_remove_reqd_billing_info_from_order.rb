class RemoveReqdBillingInfoFromOrder < ActiveRecord::Migration
  def change
    change_column :orders, :billing_address_id, :integer, :null => true
    change_column :orders, :billing_card_id, :integer, :null => true
  end
end
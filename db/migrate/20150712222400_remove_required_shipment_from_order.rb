class RemoveRequiredShipmentFromOrder < ActiveRecord::Migration
  def change
    change_column :orders, :shipment_id, :integer, :null => true
  end
end

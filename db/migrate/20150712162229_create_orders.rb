class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, :null => false
      t.integer :billing_address_id, :null => false
      t.integer :billing_card_id, :null => false
      t.integer :shipment_id, :null => false, :unique => true

      t.timestamps null: false
    end
  end
end

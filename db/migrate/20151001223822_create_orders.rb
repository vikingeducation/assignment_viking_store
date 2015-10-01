class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, :null => false
      t.integer :billing_address_id
      t.integer :billing_card_id
      t.integer :shipment_id, :unique => true

      t.timestamps null: false
    end
  end
end

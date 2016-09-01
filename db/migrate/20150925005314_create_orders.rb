class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :is_paid, :default => false
      t.integer :user_id
      t.integer :shipment_id

      t.index :user_id
      t.index :shipment_id

      t.timestamps null: false
    end
  end
end

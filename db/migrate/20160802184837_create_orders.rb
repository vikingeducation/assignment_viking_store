class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :phone_number
      t.boolean :placed, default: false
      t.boolean :delivered, default: false
      t.integer :user_id
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.integer :credit_card_id

      t.timestamps null: false
    end
  end
end

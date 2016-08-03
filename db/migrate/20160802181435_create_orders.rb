class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :shipping_address_id
      t.integer :credit_card_id, null: false
      t.integer :phone_num_id, null: false
      t.boolean :confirmed, null: false
      t.timestamps null: false
    end
  end
end

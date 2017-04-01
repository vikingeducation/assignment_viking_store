class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.integer :user_id, null: false
      t.index :user_id
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_no, null: false
      t.string :credit_card, null: false
      t.integer :def_shipping_address, null: false
      t.integer :def_billing_address, null: false

      t.timestamps
    end
  end
end

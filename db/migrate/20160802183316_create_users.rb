class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.integer :default_billing_address_id
      t.integer :default_shipping_address_id
      t.timestamps null: false
    end
  end
end

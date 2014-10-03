class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :phone_number
      t.integer :default_billing_address
      t.integer :default_shipping_address

      t.timestamps
    end
  end
end

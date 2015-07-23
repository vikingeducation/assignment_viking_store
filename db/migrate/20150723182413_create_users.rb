class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name , null: false
      t.string :email, null: false
      t.string :password, null: false
      t.integer :default_shipping_address
      t.integer :default_billing_address
      t.string :phone

      t.timestamps null: false
    end
  end
end

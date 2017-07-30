class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email, unique: true
      t.string :phone_num
      t.string :credit_card
      t.integer :default_billing_addr_id
      t.integer :default_shipping_addr_id

      t.timestamps
    end
  end
end

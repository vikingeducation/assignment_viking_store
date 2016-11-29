class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :phone_number
      t.string  :email
      t.integer :shipping_address_id
      t.integer  :billing_address_id
      t.string :credit_card

      t.timestamps
    end
  end
end

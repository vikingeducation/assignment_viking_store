class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.references :user, foreign_key: true
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.string :credit_card
      t.string :phone_number 
      t.timestamps
    end
  end
end

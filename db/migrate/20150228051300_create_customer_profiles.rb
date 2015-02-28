class CreateCustomerProfiles < ActiveRecord::Migration
  def change
    create_table :customer_profiles do |t|
      t.string :phone_number
      t.integer :default_shipping_address_id
      t.integer :default_billing_address_id
      t.integer :default_payment_method_id
      t.integer :shopping_cart_id

      t.timestamps null: false
    end
  end
end

class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|

    	t.string :first_name
    	t.string :last_name
    	t.string :phone_number
    	t.integer :user_id
    	t.integer :credit_card_id
    	t.integer :default_billing_address
    	t.integer :default_shipping_address


      t.timestamps
    end
  end
end

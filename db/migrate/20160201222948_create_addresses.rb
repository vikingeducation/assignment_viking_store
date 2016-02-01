class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.integer :user_id
      t.string :address_type
      t.boolean :billing_address_default
      t.boolean :shipping_address_default
      t.string :number
      t.string :street1
      t.string :street2
      t.integer :state_id
      t.string :zip_code

      t.integer :credit_card_id

      t.timestamps null: false
    end
  end
end

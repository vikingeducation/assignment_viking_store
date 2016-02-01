class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :phone_number
      t.integer :billing_address_id
      t.integer :shipping_address_id

      t.timestamps null: false
    end
  end
end

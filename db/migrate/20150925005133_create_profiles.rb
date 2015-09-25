class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, :limit => 32
      t.string :last_name, :limit => 32
      t.string :phone_number, :limit => 15
      t.integer :credit_card_id
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.integer :user_id

      t.index :credit_card_id
      t.index :billing_address_id
      t.index :shipping_address_id
      t.index :user_id

      t.timestamps null: false
    end
  end
end

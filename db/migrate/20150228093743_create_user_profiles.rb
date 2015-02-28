class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :default_shipping_id
      t.integer :default_billing_id
      t.integer :default_credit_card_id

      t.timestamps null: false
    end
  end
end

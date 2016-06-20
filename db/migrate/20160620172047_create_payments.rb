class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :card_number, null: false
      t.string :card_type, null: false
      t.string :expiration, null: false
      t.integer :security_code, null: false

      t.timestamps null: false
    end
  end
end

class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :billing_address_id
      t.integer :user_id
      t.datetime :expiry_date
      t.string :card_number
      t.string :security_ckde

      t.timestamps null: false
    end
  end
end

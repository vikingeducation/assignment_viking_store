class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :user_id, null: false
      t.string :number, null: false
      t.date :exp_date, null: false
      t.string :security_code, null: false
      t.integer :billing_address_id, null: false
      t.timestamps null: false
    end
  end
end

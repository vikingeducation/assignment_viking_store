class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :cc_number
      t.string :expiry_year
      t.string :expiry_month
      t.string :security_code
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

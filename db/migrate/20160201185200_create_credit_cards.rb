class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :cardholder_name, null: false
      t.string :card_number, null: false
      t.date :expiration_date, null: false
      t.string :security_code, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

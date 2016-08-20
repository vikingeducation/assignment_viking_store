class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :nickname, default: "My Credit Card"
      t.string :type,     default: "VISA"
      t.string :card_number,  null: false
      t.integer :exp_year,    null: false
      t.integer :exp_month,   null: false
      t.integer :ccv,         null: false
      t.integer :user_id,     null: false

      t.timestamps
    end
    add_index :credit_cards, :card_number, unique: true
  end
end

class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :nickname, default: "My Credit Card"
      t.string :name_on_card, null: false
      t.string :card_number, null: false
      t.string :brand, default: "VISA"
      t.integer :exp_month, null: false
      t.integer :exp_year, null: false
      t.string :ccv

      t.timestamps null: false
    end
  end
end

class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :card_number
      t.date :expiry_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

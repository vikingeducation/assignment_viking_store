class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :number, null: false
      t.string :cvc, null: false
      t.date :expiration, null: false
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end

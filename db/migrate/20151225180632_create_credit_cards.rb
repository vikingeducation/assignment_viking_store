class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :name_on_card, null: false
      t.string :card_number, null: false
      t.date :expiration, null: false

      t.timestamps null: false
    end
  end
end

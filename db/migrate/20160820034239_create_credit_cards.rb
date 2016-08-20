class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string   :card_number
      t.string   :mvc_number
      t.datetime :expire_date

      t.timestamps
    end

    add_reference   :credit_cards, :user_detail, index: true
    add_foreign_key :credit_cards, :user_details
  end
end

class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :nickname
      t.integer :card_number
      t.integer :exp_month
      t.integer :epx_year
      t.string :brand
      t.integer :user_id

      t.timestamps
    end
  end
end

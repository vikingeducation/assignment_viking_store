class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :user_id, index: true, null: false 
      t.string :number, null: false
      t.string :cvv, null: false
      t.integer :month_exp, null: false
      t.integer :year_exp, null: false

      t.timestamps
    end
  end
end

class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :exp
      t.string :csv
      t.integer :user_id
      t.integer :billing_address_id

      t.timestamps
    end
  end
end

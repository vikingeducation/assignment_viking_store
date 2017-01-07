class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :user
      t.integer :address
      t.string :number
      t.string :exp
      t.string :csv

      t.timestamps
    end
  end
end

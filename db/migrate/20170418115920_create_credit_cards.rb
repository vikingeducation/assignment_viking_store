class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :number, :null => false
      t.datetime :expiry_date, :null => false
      t.string :flag, :null => false

      t.timestamps
    end
  end
end

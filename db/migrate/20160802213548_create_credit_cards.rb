class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :user_id
      t.string :cc_number

      t.timestamps
    end
  end
end

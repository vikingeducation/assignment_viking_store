class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.references :user

      t.timestamps null: false
    end
  end
end

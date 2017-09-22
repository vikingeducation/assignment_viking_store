class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :number, null: false
      t.datetime :expiration, null: false
      t.string :cvs
      t.references :user, foreign_key: true

      t.datetime :deleted_at, default: nil
      t.timestamps
    end
  end
end

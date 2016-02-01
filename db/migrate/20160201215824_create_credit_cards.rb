class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :user_id
      t.string :card_number, unique: true, null: false
      t.string :type, null: false
      t.string :expiration, null: false
      t.integer :security, null: false
      t.boolean :default, null: false

      t.timestamps null: false
    end
    add_foreign_key :credit_cards, :users, index: true
  end
end

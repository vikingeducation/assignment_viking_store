class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :user_id
      t.bigint :number
      t.string :type
      t.string :exp
      t.integer :security
      t.boolean :default

      t.timestamps null: false
    end

    add_foreign_key :credit_cards, :users, :index
  end
end

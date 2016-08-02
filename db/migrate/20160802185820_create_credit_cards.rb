class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :vender
      t.integer :number
      t.integer :csc
      t.date :expiration
      t.integer :user_id
      t.boolean :on_file, default: true

      t.timestamps null: false
    end
  end
end

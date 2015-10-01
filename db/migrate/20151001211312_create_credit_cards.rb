class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :number, :null => false, :unique => true
      t.integer :expiration_month, :null => false
      t.integer :expiration_year, :null => false
      t.integer :csv_code, :null => false
      t.boolean :default_billing, :null => false, :default => false
      t.integer :user_id, :null => false

      t.timestamps null: false
    end
  end
end

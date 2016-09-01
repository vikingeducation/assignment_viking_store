class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :number, :limit => 19
      t.date :expiration_date
      t.integer :profile_id
      t.integer :company_id

      t.index :profile_id
      t.index :company_id

      t.timestamps null: false
    end
  end
end

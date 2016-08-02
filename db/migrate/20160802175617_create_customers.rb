class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.references :user, foreign_key: true
      t.string :credit_card
      t.string :phone_number 
      t.timestamps
    end
  end
end

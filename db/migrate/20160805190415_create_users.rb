class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.integer :card_id
      t.integer :bill_id
      t.integer :ship_id
      t.timestamps
    end
  end
end

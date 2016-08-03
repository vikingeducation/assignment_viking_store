class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      t.string :name
      t.string :phone
      t.string :email
      t.bigint :credit_card

      t.integer :address_id
      t.integer :billing_id
      
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end

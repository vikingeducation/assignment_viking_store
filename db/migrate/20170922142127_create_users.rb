class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number
      t.datetime :joined_at

      t.timestamps
      t.datetime :deleted_at, default: nil
    end
  end
end

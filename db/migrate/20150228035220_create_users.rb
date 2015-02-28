class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :customer_profile_id

      t.timestamps null: false
    end
  end
end

class CreateUserDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_details do |t|
      t.string  :phone_number
      t.integer :user_id, :index => true

      t.timestamps
    end

    add_foreign_key :users, :user_details
  end
end

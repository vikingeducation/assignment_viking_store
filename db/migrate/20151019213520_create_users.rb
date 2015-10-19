class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :first_name
      t.string  :email, index: true, unique: true, null: false
      t.string  :phone

      t.timestamps null: false
    end
  end
end

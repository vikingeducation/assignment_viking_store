class CreatePhoneNums < ActiveRecord::Migration
  def change
    create_table :phone_nums do |t|
      t.integer :user_id, null: false
      t.string :number, null: false
      t.string :type, null: false
      t.timestamps null: false
    end
  end
end

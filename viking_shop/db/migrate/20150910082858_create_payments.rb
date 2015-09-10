class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|

      t.integer :user_id,   null: false
      t.string :card_num, null: false
      t.string :card_type, null: false

      t.timestamps null: false
    end
  end
end

class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :card_number
      t.datetime :exp_date

      t.timestamps null: false
    end
  end
end

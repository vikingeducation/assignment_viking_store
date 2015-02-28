class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.integer :customer_profile_id
      t.string :name_on_card
      t.string :card_number
      t.datetime :exp_date
      t.integer :security_code

      t.timestamps null: false
    end

    change_table :orders do |t|
      t.rename :customer_id, :customer_profile_id
    end
  end
end

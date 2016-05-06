class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer :user_id
      t.integer :address_id
      t.integer :credit_card_id
      t.timestamps null: false
    end

    add_foreign_key :billings, :users, :index
    add_foreign_key :billings, :addresses, :index
    add_foreign_key :billings, :credit_cards, :index
  end
end

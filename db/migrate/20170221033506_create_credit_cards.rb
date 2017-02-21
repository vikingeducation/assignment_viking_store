class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.references :user, null: false
      t.string :full_name, null: false
      t.string :number, null:false
      t.string :card_type, null: false
      t.integer :exp_month, null: false
      t.integer :exp_year, null: false
      t.integer :billing_address_id, index:true, null: false

      t.timestamps
    end
  end
end

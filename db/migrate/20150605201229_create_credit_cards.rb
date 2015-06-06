class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
    	t.integer :user_id, :null => false
    	t.integer :credit_card_number, :null => false
    	t.string :exp_date, :null => false
    	t.integer :cvv_code, :null => false

      t.timestamps null: false
    end

    change_column_null :addresses, :user_id, false
  end
end
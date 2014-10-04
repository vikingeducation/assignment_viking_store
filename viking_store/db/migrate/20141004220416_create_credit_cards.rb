class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
    	t.integer	:user_id,					null: false					
    	t.integer	:card_number,			null: false
    	t.integer	:expiration_month,null: false
    	t.integer	:experiation_year,null: false
    	t.string	:type,						null: false

      t.timestamps
    end
  end
end

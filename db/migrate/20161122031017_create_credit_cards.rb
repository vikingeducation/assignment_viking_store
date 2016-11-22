class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|

    	t.string :number, :limit => 16

    	t.integer :profile_id

      t.timestamps
    end
  end
end

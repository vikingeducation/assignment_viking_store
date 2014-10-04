class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.integer :number
      t.integer :exp_month
      t.integer :exp_year
      t.integer :ccv

      t.timestamps
    end
  end
end

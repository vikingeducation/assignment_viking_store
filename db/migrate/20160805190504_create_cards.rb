class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :user_id, null: false 
      t.date :exp, null: false
      t.integer :number, null: false
      t.timestamps
    end
  end
end

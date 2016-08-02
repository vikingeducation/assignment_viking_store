class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :number
      t.string :company
      t.date :exp_date
      t.string :security_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :number, null: false
      t.string :company, null: false
      t.date :exp_date, null: false
      t.string :security_code, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end

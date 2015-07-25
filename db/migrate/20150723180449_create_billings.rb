class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer   :user_id,     null: false
      t.integer   :address_id,  null: false
      t.string   :cc_number,   null: false
      t.string    :cc_type,     null: false
      t.date      :cc_exp,      null: false
      t.timestamps null: false
    end
  end
end

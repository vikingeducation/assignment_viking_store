class CreateBillAdds < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_adds do |t|

      t.timestamps
    end
  end
end

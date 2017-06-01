class CreateShipAdds < ActiveRecord::Migration[5.0]
  def change
    create_table :ship_adds do |t|

      t.timestamps
    end
  end
end

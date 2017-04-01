class CreateCustomerAddrRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_addr_refs do |t|
      t.integer :customer_id
      t.string :address_id

      t.timestamps
    end
  end
end

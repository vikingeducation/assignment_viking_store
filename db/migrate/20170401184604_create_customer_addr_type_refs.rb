class CreateCustomerAddrTypeRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_addr_type_refs do |t|
      t.integer :customer_addr_ref_id
      t.integer :adress_type_id

      t.timestamps
    end
  end
end

class ChangeColumnInBilling < ActiveRecord::Migration
  def change
    remove_column :billings, :type
    add_column :billings, :card_issuer, :string
  end
end

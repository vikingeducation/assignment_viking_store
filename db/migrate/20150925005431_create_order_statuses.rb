class CreateOrderStatuses < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :name, :limit => 32

      t.timestamps null: false
    end
  end
end

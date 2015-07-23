class AddIndexToProduct < ActiveRecord::Migration
  def change
    add_index(:products, :sku, {unique: true})
  end
end

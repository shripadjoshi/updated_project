class AddDeltaToProductType < ActiveRecord::Migration
  def change
    add_column :product_types, :delta, :boolean, default: true, null: false
  end
end

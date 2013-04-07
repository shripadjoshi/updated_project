class AddDeltaToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :delta, :boolean, default: true, null: false
  end
end

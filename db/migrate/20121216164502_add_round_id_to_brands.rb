class AddRoundIdToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :round_id, :integer
  end
end

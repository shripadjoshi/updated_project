class AddDeltaToSkinHairTypes < ActiveRecord::Migration
  def change
    add_column :skin_hair_types, :delta, :boolean, default: true, null: false
  end
end

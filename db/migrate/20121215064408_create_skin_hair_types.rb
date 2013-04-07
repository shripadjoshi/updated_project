class CreateSkinHairTypes < ActiveRecord::Migration
  def change
    create_table :skin_hair_types do |t|
      t.string :skin_hair_type

      t.timestamps
    end
  end
end

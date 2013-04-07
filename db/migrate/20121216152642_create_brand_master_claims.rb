class CreateBrandMasterClaims < ActiveRecord::Migration
  def change
    create_table :brand_master_claims do |t|
      t.integer :brand_id
      t.integer :master_claim_id

      t.timestamps
    end
  end
end

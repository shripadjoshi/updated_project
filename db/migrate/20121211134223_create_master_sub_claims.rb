class CreateMasterSubClaims < ActiveRecord::Migration
  def change
    create_table :master_sub_claims do |t|
      t.integer :master_claim_id
      t.integer :sub_claim_id

      t.timestamps
    end
  end
end

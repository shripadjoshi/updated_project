class CreateAdditionalClaimSubClaims < ActiveRecord::Migration
  def change
    create_table :additional_claim_sub_claims do |t|
      t.integer :additional_claim_id
      t.integer :sub_claim_id

      t.timestamps
    end
  end
end

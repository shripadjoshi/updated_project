class CreateAdditionalClaims < ActiveRecord::Migration
  def change
    create_table :additional_claims do |t|
      t.integer :master_claim_id
      t.integer :product_id
      t.string :claim_type
      t.string :research_status
      t.integer :assigned_to
      t.string :copy_status
      t.integer :copy_assigned_to
      t.text :chemical_summary
      t.text :editorial_summary
      t.text :question
      t.text :answer
      t.text :allergy_concerns
      t.text :other_concerns
      t.text :chemical_info_from_company

      t.timestamps
    end
  end
end

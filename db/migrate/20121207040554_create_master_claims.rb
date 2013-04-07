class CreateMasterClaims < ActiveRecord::Migration
  def change
    create_table :master_claims do |t|
      t.string :name
      t.string :avatar1

      t.timestamps
    end
  end
end

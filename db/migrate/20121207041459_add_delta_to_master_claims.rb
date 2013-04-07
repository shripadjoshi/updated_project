class AddDeltaToMasterClaims < ActiveRecord::Migration
  def change
    add_column :master_claims, :delta, :boolean, default: true, null: false
  end
end

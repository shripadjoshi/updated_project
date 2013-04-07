class AddDeltaToSubClaims < ActiveRecord::Migration
  def change
    add_column :sub_claims, :delta, :boolean, default: true, null: false
  end
end

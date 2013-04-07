class AddDeltaToAdditionalClaim < ActiveRecord::Migration
  def change
    add_column :additional_claims, :delta, :boolean, default: true, null: false
  end
end

class AddDeltaToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :delta, :boolean, default: true, null: false
  end
end

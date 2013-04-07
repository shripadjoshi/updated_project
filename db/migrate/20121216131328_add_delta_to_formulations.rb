class AddDeltaToFormulations < ActiveRecord::Migration
  def change
    add_column :formulations, :delta, :boolean, default: true, null: false
  end
end

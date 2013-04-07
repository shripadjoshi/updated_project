class AddDeltaToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :delta, :boolean, default: true, null: false
  end
end

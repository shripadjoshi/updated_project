class AddDeltaToIngredientClasses < ActiveRecord::Migration
  def change
    add_column :ingredient_classes, :delta, :boolean, default: true, null: false
  end
end

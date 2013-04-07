class CreateIngredientClasses < ActiveRecord::Migration
  def change
    create_table :ingredient_classes do |t|
      t.string :class_name
      t.text :class_definition
      t.string :avatar1
      t.string :avatar2
      t.string :avatar3

      t.timestamps
    end
  end
end

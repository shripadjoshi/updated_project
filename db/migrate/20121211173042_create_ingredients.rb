class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :ingredient
      t.string :latin_name
      t.text :ingredient_definition
      t.string :avatar1
      t.string :avatar2
      t.string :avatar3

      t.timestamps
    end
  end
end

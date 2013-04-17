class CreateTypeOfIngredients < ActiveRecord::Migration
  def change
    create_table :type_of_ingredients do |t|
      t.string :name
      t.boolean :delta, default: true, null: false
      t.timestamps
    end
  end
end

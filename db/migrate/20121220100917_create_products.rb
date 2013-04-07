class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.text :application_direction
      t.float :price
      t.text :ingredients

      t.timestamps
    end
  end
end

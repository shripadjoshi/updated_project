class CreateFormulations < ActiveRecord::Migration
  def change
    create_table :formulations do |t|
      t.string :formulation_name

      t.timestamps
    end
  end
end

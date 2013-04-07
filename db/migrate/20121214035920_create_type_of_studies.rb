class CreateTypeOfStudies < ActiveRecord::Migration
  def change
    create_table :type_of_studies do |t|
      t.string :name

      t.timestamps
    end
  end
end

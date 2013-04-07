class AddDeltaToTypeOfStudies < ActiveRecord::Migration
  def change
    add_column :type_of_studies, :delta, :boolean, default: true, null: false
  end
end

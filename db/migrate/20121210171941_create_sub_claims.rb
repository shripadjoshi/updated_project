class CreateSubClaims < ActiveRecord::Migration
  def change
    create_table :sub_claims do |t|
      t.string :name

      t.timestamps
    end
  end
end

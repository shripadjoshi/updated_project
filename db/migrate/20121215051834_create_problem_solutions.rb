class CreateProblemSolutions < ActiveRecord::Migration
  def change
    create_table :problem_solutions do |t|
      t.string :problem

      t.timestamps
    end
  end
end

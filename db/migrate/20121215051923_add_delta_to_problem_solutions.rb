class AddDeltaToProblemSolutions < ActiveRecord::Migration
  def change
    add_column :problem_solutions, :delta, :boolean, default: true, null: false
  end
end

class CreateMasterClaimProblemSolutions < ActiveRecord::Migration
  def change
    create_table :master_claim_problem_solutions do |t|
      t.integer :master_claim_id
      t.integer :problem_solution_id

      t.timestamps
    end
  end
end

class MasterClaimProblemSolution < ActiveRecord::Base
  attr_accessible :master_claim_id, :problem_solution_id

  belongs_to :master_claim
  belongs_to :problem_solution
end

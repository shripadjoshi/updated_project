class ProblemSolution < ActiveRecord::Base
  attr_accessible :problem

  validates :problem, presence: true, uniqueness: {case_sensitive: false}

  has_many :master_claim_problem_solutions, dependent: :destroy
  has_many :master_claims, through: :master_claim_problem_solutions

  def as_xls(options = {})
    {
      "Problem Solution" => problem,
    }
  end

  define_index do
    indexes problem, sortable: true
    set_property delta: true
  end
end

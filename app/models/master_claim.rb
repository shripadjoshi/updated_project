class MasterClaim < ActiveRecord::Base
  attr_accessible :avatar1, :name, :sub_claim_ids, :problem_solution_ids
  mount_uploader :avatar1, ImageUploader
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :master_sub_claims, dependent: :destroy
  has_many :sub_claims, through: :master_sub_claims

  has_many :brand_master_claims, dependent: :destroy
  has_many :brands, through: :brand_master_claims

  has_many :master_claim_problem_solutions, dependent: :destroy
  has_many :problem_solutions, through: :master_claim_problem_solutions

  has_many :additional_claims

  scope :include_associated_classes, include: [:sub_claims, :problem_solutions]

  def as_xls(options = {})
    {
      "Master Claim" => name,
    }
  end

  define_index do
    indexes name, sortable: true
    set_property delta: true
  end

end
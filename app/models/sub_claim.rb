class SubClaim < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :master_sub_claims, dependent: :destroy
  has_many :master_claims, through: :master_sub_claims

  has_many :additional_claim_sub_claims, dependent: :destroy
  has_many :additional_claims, through: :additional_claim_sub_claims

  def as_xls(options = {})
    {
      "Sub Claim" => name,
    }
  end

  define_index do
    indexes name, sortable: true
    set_property delta: true
  end

end

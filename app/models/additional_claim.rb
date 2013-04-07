class AdditionalClaim < ActiveRecord::Base
  attr_accessible :allergy_concerns, :answer, :assigned_to, :chemical_info_from_company, :chemical_summary, :claim_type, :copy_assigned_to, :copy_status, :editorial_summary, :master_claim_id, :other_concerns, :product_id, :question, :research_status, :sub_claim_ids

  belongs_to :product
  delegate :name, to: :product, allow_nil: true, prefix: true

  belongs_to :master_claim
  delegate :name, to: :master_claim, allow_nil: true, prefix: true

  belongs_to :assignee, class_name: "User", foreign_key: "assigned_to"
  delegate :name, to: :assignee, allow_nil: true, prefix: true

  belongs_to :editor, class_name: "User", foreign_key: "copy_assigned_to"

  has_many :additional_claim_sub_claims, dependent: :destroy
  has_many :sub_claims, through: :additional_claim_sub_claims

  validates :master_claim_id, :claim_type, :research_status, presence: true
  validates :assigned_to, presence: true, if: :status_other_then_unassigned?
  validate :status_is_unassigned

  scope :include_associated_classes, include: [:sub_claims, :master_claim, :assignee]
  scope :fetch_chemist_type_claims, where("claim_type = ?", 'Additional Claim-Chemist')
  #scope :paginate_data, lambda{|page_no| paginate(page: page_no, per_page: 1)}

  
  def as_xls(options = {})
    {
      "Claim / Sub Claim" => self.master_claim_name.capitalize + "/" + self.sub_claims.collect(&:name).join(", "),
      "Claim Type" => claim_type,
      "Research Status" => research_status,
      "Assigned To" => self.assignee_name,
      "Modified At" => updated_at.to_s(:full_friendly)
    }
  end

  define_index do
    indexes research_status, claim_type, sortable: true
    indexes master_claim(:name), as: :master_claim, sortable: true    
    #indexes user(:name), as: :assigned_to, sortable: true
    #indexes self.assignee_name
    has product_id, master_claim_id#, assigned_to
    set_property delta: true
  end

  private
  def status_other_then_unassigned?
    !self.research_status.eql?("Unassigned")
  end

  def status_is_unassigned
    if self.assigned_to.present? && self.research_status.eql?("Unassigned")
      errors.add(:research_status, "can't assigned to unassigned additional claim")
    end
  end  

end

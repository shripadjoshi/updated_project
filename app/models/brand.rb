class Brand < ActiveRecord::Base
  attr_accessible :name, :master_claim_ids, :round_id
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :brand_master_claims, dependent: :destroy
  has_many :master_claims, through: :brand_master_claims

  belongs_to :round
  delegate :round_name, to: :round, allow_nil: true

  has_many :products, dependent: :destroy

  scope :include_associated_classes, include: [:master_claims, :round]

  def as_xls(options = {})
    {
      "Brand Name" => name,
    }
  end

  define_index do
    indexes name, sortable: true
    set_property delta: true
  end
end

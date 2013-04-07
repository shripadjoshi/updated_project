class BrandMasterClaim < ActiveRecord::Base
  attr_accessible :brand_id, :master_claim_id
  belongs_to :master_claim
  belongs_to :brand
end

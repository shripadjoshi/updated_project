class AdditionalClaimSubClaim < ActiveRecord::Base
  attr_accessible :additional_claim_id, :sub_claim_id
  belongs_to :additional_claim
  belongs_to :sub_claim
end

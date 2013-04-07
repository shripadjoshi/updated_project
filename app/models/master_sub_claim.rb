class MasterSubClaim < ActiveRecord::Base
  attr_accessible :master_claim_id, :sub_claim_id
  belongs_to :master_claim
  belongs_to :sub_claim
end

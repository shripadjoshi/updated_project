module AdditionalClaimsHelper
  def accessibility_conditions(claim)
    ((current_user.has_role? :admin) || (claim.assignee_name.eql?(current_user.name)) || 
        claim.research_status.eql?("Unassigned") || (current_user.has_role? :editor))
  end
end

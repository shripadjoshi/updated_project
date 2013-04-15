module AdditionalClaimsHelper
  def accessibility_conditions(claim)
    if (current_user.has_role?(:admin) || current_user.has_role?(:chemist))
      ((current_user.has_role? :admin) || (claim.assignee_name.eql?(current_user.name)) ||
        claim.research_status.eql?("Unassigned") )
    else
      (claim.editor_name.eql?(current_user.name) || claim.copy_status.eql?("Unassigned") )
    end
  end
end

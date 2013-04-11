class AdditionalClaimsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_role, only: [:new, :create]

  def index
    @product            = Product.find(params[:product_id])
    @additional_claims  = @product.fetch_additional_claims(current_user, params)
    
    respond_to do |format|
      format.html
      format.xls { send_data @additional_claims.to_xls, content_type: 'application/vnd.ms-excel', filename: 'additional_claims.xls' }
    end
  end

  def new
    @product           = Product.find(params[:product_id])
    @additional_claim  = @product.additional_claims.new
    @sub_claims        = []
    @assignees         = User.admins
  end

  def create
    @product = Product.find(params[:product_id])
    @additional_claim = @product.additional_claims.new(params[:additional_claim])
    respond_to do |format|
      if @additional_claim.save
        format.html { redirect_to product_additional_claims_path(@product), notice: 'Additional claim was successfully created.' }
        format.json { render json: @additional_claim, status: :created, location: @additional_claim }
      else
        @sub_claims        = []
        @assignees         = params[:additional_claim][:claim_type].eql?("Additional Claim-Admin") ?  User.admins : User.all_users
        format.html { render "new" }
        format.json { render json: @additional_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @product           = Product.find(params[:product_id])
    @additional_claim  = AdditionalClaim.find(params[:id])
    collected_instancese
    flash[:notice]     = "Assigne the claim to your self" if @additional_claim.research_status.eql?("Unassigned")
    raise CanCan::AccessDenied unless check_user_accessibility?
  end
    
  def update
    @product           = Product.find(params[:product_id])
    @additional_claim  = AdditionalClaim.find(params[:id])
    respond_to do |format|
      if @additional_claim.update_attributes(params[:additional_claim])
        format.html { redirect_to product_additional_claims_path(@product), notice: "Additional Claim was successfully updated."}
        format.json { head :no_content }
      else
        collected_instancese
        format.html { render "edit" }
        format.json { render json: @additional_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @additional_claim  = AdditionalClaim.find(params[:id])    
  end

  def destroy
    @product            = Product.find(params[:product_id])
    @additional_claim   = AdditionalClaim.find(params[:id])
    @additional_claim.destroy
    redirect_to product_additional_claims_path(@product)
  end

  def users
    @assignees        = User.admins if params[:claim_type].eql?("Additional Claim-Admin")
    @assignees        = User.all_users if params[:claim_type].eql?("Additional Claim-Chemist")
  end

  private
  def check_user_accessibility?
    if current_user.has_role? :admin
      true
    elsif(current_user.has_role? :chemist)
      @additional_claim.claim_type.eql?("Additional Claim-Admin") ? false : true
    elsif(current_user.has_role? :editor)
      true
    end
  end

  def collected_instancese
    @sub_claims        = @additional_claim.sub_claims
    @assignees         = User.admins if @additional_claim.claim_type.eql?("Additional Claim-Admin")
    @assignees         = User.all_users if @additional_claim.claim_type.eql?("Additional Claim-Chemist")
  end

end

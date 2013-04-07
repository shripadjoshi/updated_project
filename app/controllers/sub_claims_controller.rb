class SubClaimsController < ApplicationController
  before_filter :authenticate_user!, :authorize_role, :fetch_sub_claim

  def index
    @sub_claims = params[:search] ? SubClaim.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : SubClaim.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @sub_claims.to_xls, content_type: 'application/vnd.ms-excel', filename: 'sub_claims.xls' }
    end
  end

  def new
    @sub_claim = SubClaim.new
  end

  def create
    @sub_claim = SubClaim.new(params[:sub_claim])
    respond_to do |format|
      if @sub_claim.save
        format.html { redirect_to sub_claims_path, notice: 'Sub claim was successfully created.' }
        format.json { render json: @sub_claim, status: :created, location: @sub_claim }
      else
        format.html { render "new" }
        format.json { render json: @sub_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @sub_claim.update_attributes(params[:sub_claim])
        format.html { redirect_to sub_claims_path, notice: "Sub claim was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @sub_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sub_claim.destroy
    respond_to do |format|
     format.html { redirect_to sub_claims_path, notice: "Sub claim was successfully deleted."}
    end
  end

  private
  def fetch_sub_claim
    @sub_claim = SubClaim.find(params[:id]) if params[:id]
  end
end
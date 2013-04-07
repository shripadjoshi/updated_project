class MasterClaimsController < ApplicationController
  before_filter :authenticate_user!, :fetch_master_claim
  before_filter :authorize_role, except: [:sub_claims]

  def index
    @master_claims = params[:search] ?
      MasterClaim.include_associated_classes.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) :
      MasterClaim.include_associated_classes.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @master_claims.to_xls, content_type: 'application/vnd.ms-excel', filename: 'master_claims.xls' }
    end
  end

  def new
    @master_claim = MasterClaim.new
  end

  def create
    @master_claim = MasterClaim.new(params[:master_claim])
    respond_to do |format|
      if @master_claim.save
        format.html { redirect_to master_claims_path, notice: 'Master claim was successfully created.' }
        format.json { render json: @master_claim, status: :created, location: @master_claim }
      else
        format.html { render "new" }
        format.json { render json: @master_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @master_claim.remove_avatar1 = true if params[:remove_image].present?
    respond_to do |format|
      if @master_claim.update_attributes(params[:master_claim])
        format.html { redirect_to master_claims_path, notice: "Master claim was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @master_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @master_claim.destroy
    respond_to do |format|
     format.html { redirect_to master_claims_path, notice: "Master claim was successfully deleted."}
    end
  end

  def sub_claims
    puts ":::::::::::::::::::::::::::::::::::::::"
    puts params.inspect
    puts ":::::::::::::::::::::::::::::::::::::::"
    #raise @master_claim.inspect
    @sub_claims = @master_claim.sub_claims
  end

  private
  def fetch_master_claim
    @master_claim = MasterClaim.find(params[:id]) if params[:id]
  end
end

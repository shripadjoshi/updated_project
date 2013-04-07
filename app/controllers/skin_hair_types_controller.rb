class SkinHairTypesController < ApplicationController
  before_filter :authenticate_user!, :authorize_role

  def index
    @skin_hair_types = params[:search] ? SkinHairType.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : SkinHairType.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @skin_hair_types.to_xls, content_type: 'application/vnd.ms-excel', filename: 'skin_hair_types.xls' }
    end
  end

  def new
    @skin_hair_type = SkinHairType.new
  end

  def create
    @skin_hair_type = SkinHairType.new(params[:skin_hair_type])
    respond_to do |format|
      if @skin_hair_type.save
        format.html { redirect_to skin_hair_types_path, notice: 'Skin hair type was successfully created.' }
        format.json { render json: @skin_hair_type, status: :created, location: @skin_hair_type }
      else
        format.html { render "new" }
        format.json { render json: @skin_hair_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @skin_hair_type = SkinHairType.find(params[:id])
  end

  def update
    @skin_hair_type = SkinHairType.find(params[:id])
    respond_to do |format|
      if @skin_hair_type.update_attributes(params[:skin_hair_type])
        format.html { redirect_to skin_hair_types_path, notice: "Skin hair type was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @skin_hair_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skin_hair_type = SkinHairType.find(params[:id])
    @skin_hair_type.destroy
    respond_to do |format|
     format.html { redirect_to skin_hair_types_path, notice: "Skin hair type was successfully deleted."}
    end
  end
end

class BrandsController < ApplicationController
  before_filter :authenticate_user!, :authorize_role

  def index
    @brands = params[:search] ? Brand.include_associated_classes.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : Brand.include_associated_classes.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @brands.to_xls, content_type: 'application/vnd.ms-excel', filename: 'brands.xls' }
    end
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(params[:brand])
    respond_to do |format|
      if @brand.save
        format.html { redirect_to brands_path, notice: 'Brand was successfully created.' }
        format.json { render json: @brand, status: :created, location: @brand }
      else
        format.html { render "new" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to brands_path, notice: "Brand was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    respond_to do |format|
     format.html { redirect_to brands_path, notice: "Brand was successfully deleted."}
    end
  end
end

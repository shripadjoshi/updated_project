class ProductTypesController < ApplicationController
  before_filter :authenticate_user!, :authorize_role, :fetch_product_type

  def index
    @product_types = params[:search] ? ProductType.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : ProductType.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @product_types.to_xls, content_type: 'application/vnd.ms-excel', filename: 'product_types.xls' }
    end
  end

  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new(params[:product_type])
    respond_to do |format|
      if @product_type.save
        format.html { redirect_to product_types_path, notice: 'Product type was successfully created.' }
        format.json { render json: @product_type, status: :created, location: @product_type }
      else
        format.html { render "new" }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @product_type.update_attributes(params[:product_type])
        format.html { redirect_to product_types_path, notice: "Product type was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_type.destroy
    respond_to do |format|
     format.html { redirect_to product_types_path, notice: "Product type was successfully deleted."}
    end
  end

  private
  def fetch_product_type
    @product_type = ProductType.find(params[:id]) if params[:id]
  end
end

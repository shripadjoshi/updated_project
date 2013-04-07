class ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_role, except: [:index]

  def index
    @products = params[:search] ? Product.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : Product.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @products.to_xls, content_type: 'application/vnd.ms-excel', filename: 'products.xls' }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    respond_to do |format|
      if @product.save
        flash[:notice]  = 'Product was successfully created.'
        format.html { 
          redirect_to products_path  if params[:claim_type].blank?
          redirect_to new_product_additional_claim_path(@product)  if params[:claim_type].present? && params[:claim_type].eql?("additional")
          redirect_to products_path  if params[:claim_type].present? && params[:claim_type].eql?("label")
          }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to products_path, notice: "Product was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Product was successfully deleted."}
    end
  end

end

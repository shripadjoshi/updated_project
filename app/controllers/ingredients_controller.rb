class IngredientsController < ApplicationController
  before_filter :authenticate_user!, :authorize_role, :fetch_ingredient

  def index
    @ingredients = params[:search] ? Ingredient.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : Ingredient.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @ingredients.to_xls, content_type: 'application/vnd.ms-excel', filename: 'ingredients.xls' }
    end
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params[:ingredient])
    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredients_path, notice: 'Ingredient was successfully created.' }
        format.json { render json: @ingredient, status: :created, location: @ingredient }
      else
        format.html { render "new" }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @ingredient.remove_image(params[:remove_image]) if params[:remove_image].present?
    respond_to do |format|
      if @ingredient.update_attributes(params[:ingredient])
        format.html { redirect_to ingredients_path, notice: "Ingredient was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ingredient.destroy
    respond_to do |format|
     format.html { redirect_to ingredients_path, notice: "Ingredient was successfully deleted."}
    end
  end

  private
  def fetch_ingredient
    @ingredient = Ingredient.find(params[:id]) if params[:id]
  end
end

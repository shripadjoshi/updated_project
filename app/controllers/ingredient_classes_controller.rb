class IngredientClassesController < ApplicationController
  before_filter :authenticate_user!, :authorize_role, :fetch_ingredient_class

  def index
    @ingredient_classes = params[:search] ? IngredientClass.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : IngredientClass.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @ingredient_classes.to_xls, content_type: 'application/vnd.ms-excel', filename: 'ingredient_classes.xls' }
    end
  end

  def new
    @ingredient_class = IngredientClass.new
  end

  def create
    @ingredient_class = IngredientClass.new(params[:ingredient_class])
    respond_to do |format|
      if @ingredient_class.save
        format.html { redirect_to ingredient_classes_path, notice: 'Ingredient class was successfully created.' }
        format.json { render json: @ingredient_class, status: :created, location: @ingredient_class }
      else
        format.html { render "new" }
        format.json { render json: @ingredient_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @ingredient_class.remove_image(params[:remove_image]) if params[:remove_image].present?
    respond_to do |format|
      if @ingredient_class.update_attributes(params[:ingredient_class])
        format.html { redirect_to ingredient_classes_path, notice: "Ingredient class was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @ingredient_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ingredient_class.destroy
    respond_to do |format|
     format.html { redirect_to ingredient_classes_path, notice: "Ingredient class was successfully deleted."}
    end
  end


  private
  def fetch_ingredient_class
    @ingredient_class = IngredientClass.find(params[:id]) if params[:id]
  end
end

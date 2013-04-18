class TypeOfIngredientsController < ApplicationController
  before_filter :authenticate_user!, :authorize_role
  
  def index
    @type_of_ingredients = params[:search] ? TypeOfIngredient.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : TypeOfIngredient.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xls { send_data @type_of_ingredients.to_xls, content_type: 'application/vnd.ms-excel', filename: 'type_of_ingredients.xls' }
    end
  end

  def new
    @type_of_ingredient = TypeOfIngredient.new    
  end
 
  def edit
    @type_of_ingredient = TypeOfIngredient.find(params[:id])
  end

  def create
    @type_of_ingredient = TypeOfIngredient.new(params[:type_of_ingredient])

    respond_to do |format|
      if @type_of_ingredient.save
        format.html { redirect_to type_of_ingredients_path, notice: 'Type of ingredient was successfully created.' }
        format.json { render json: @type_of_ingredient, status: :created, location: @type_of_ingredient }
      else
        format.html { render action: "new" }
        format.json { render json: @type_of_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @type_of_ingredient = TypeOfIngredient.find(params[:id])

    respond_to do |format|
      if @type_of_ingredient.update_attributes(params[:type_of_ingredient])
        format.html { redirect_to type_of_ingredients_path, notice: 'Type of ingredient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type_of_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    ######TODO need to write the condition for delete
    @type_of_ingredient = TypeOfIngredient.find(params[:id])
    @type_of_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to type_of_ingredients_url, notice: 'Type of ingredient was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end

class TypeOfStudiesController < ApplicationController
  before_filter :authenticate_user!, :authorize_role

  def index
    @type_of_studies = params[:search] ? TypeOfStudy.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : TypeOfStudy.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @type_of_studies.to_xls, content_type: 'application/vnd.ms-excel', filename: 'type_of_studies.xls' }
    end
  end

  def new
    @type_of_study = TypeOfStudy.new
  end

  def create
    @type_of_study = TypeOfStudy.new(params[:type_of_study])
    respond_to do |format|
      if @type_of_study.save
        format.html { redirect_to type_of_studies_path, notice: 'Type of study was successfully created.' }
        format.json { render json: @type_of_study, status: :created, location: @type_of_study }
      else
        format.html { render "new" }
        format.json { render json: @type_of_study.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @type_of_study = TypeOfStudy.find(params[:id])
  end

  def update
    @type_of_study = TypeOfStudy.find(params[:id])
    respond_to do |format|
      if @type_of_study.update_attributes(params[:type_of_study])
        format.html { redirect_to type_of_studies_path, notice: "Type of study was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @type_of_study.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    ###TODO Need to write the condition for delete
    @type_of_study = TypeOfStudy.find(params[:id])
    @type_of_study.destroy
    respond_to do |format|
     format.html { redirect_to type_of_studies_path, notice: "Type of study was successfully deleted."}
    end
  end
end

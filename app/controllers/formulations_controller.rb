class FormulationsController < ApplicationController
  before_filter :authenticate_user!, :authorize_role

  def index
    @formulations = params[:search] ? Formulation.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : Formulation.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @formulations.to_xls, content_type: 'application/vnd.ms-excel', filename: 'formulations.xls' }
    end
  end

  def new
    @formulation = Formulation.new
  end

  def create
    @formulation = Formulation.new(params[:formulation])
    respond_to do |format|
      if @formulation.save
        format.html { redirect_to formulations_path, notice: 'Formulation was successfully created.' }
        format.json { render json: @formulation, status: :created, location: @formulation }
      else
        format.html { render "new" }
        format.json { render json: @formulation.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @formulation = Formulation.find(params[:id])
  end

  def update
    @formulation = Formulation.find(params[:id])
    respond_to do |format|
      if @formulation.update_attributes(params[:formulation])
        format.html { redirect_to formulations_path, notice: "Formulation was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @formulation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @formulation = Formulation.find(params[:id])
    @formulation.destroy
    respond_to do |format|
      format.html { redirect_to formulations_path, notice: "Formulation was successfully deleted."}
    end
  end
end

class ProblemSolutionsController < ApplicationController
  before_filter :authenticate_user!, :authorize_role

  def index
    @problem_solutions = params[:search] ? ProblemSolution.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : ProblemSolution.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @problem_solutions.to_xls, content_type: 'application/vnd.ms-excel', filename: 'problem_solutions.xls' }
    end
  end

  def new
    @problem_solution = ProblemSolution.new
  end

  def create
    @problem_solution = ProblemSolution.new(params[:problem_solution])
    respond_to do |format|
      if @problem_solution.save
        format.html { redirect_to problem_solutions_path, notice: 'Problem solution was successfully created.' }
        format.json { render json: @problem_solution, status: :created, location: @problem_solution }
      else
        format.html { render "new" }
        format.json { render json: @problem_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @problem_solution = ProblemSolution.find(params[:id])
  end

  def update
    @problem_solution = ProblemSolution.find(params[:id])
    respond_to do |format|
      if @problem_solution.update_attributes(params[:problem_solution])
        format.html { redirect_to problem_solutions_path, notice: "Problem solution was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @problem_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @problem_solution = ProblemSolution.find(params[:id])
    @problem_solution.destroy
    respond_to do |format|
     format.html { redirect_to problem_solutions_path, notice: "Problem solution was successfully deleted."}
    end
  end


end

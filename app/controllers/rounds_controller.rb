class RoundsController < ApplicationController
  before_filter :authenticate_user!, :authorize_role

  def index
    @rounds = params[:search] ? Round.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : Round.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @rounds.to_xls, content_type: 'application/vnd.ms-excel', filename: 'rounds.xls' }
    end
  end

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(params[:round])
    respond_to do |format|
      if @round.save
        format.html { redirect_to rounds_path, notice: 'Round was successfully created.' }
        format.json { render json: @round, status: :created, location: @round }
      else
        format.html { render "new" }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @round = Round.find(params[:id])
  end

  def update
    @round = Round.find(params[:id])
    respond_to do |format|
      if @round.update_attributes(params[:round])
        format.html { redirect_to rounds_path, notice: "Round was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @round = Round.find(params[:id])
    @round.destroy
    respond_to do |format|
      format.html { redirect_to rounds_path, notice: "Round was successfully deleted."}
    end
  end
end
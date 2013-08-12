class UsersController < ApplicationController
  before_filter :authenticate_user!, :authorize_role

  def index
    @roles = Role.all
    users = User.include_user_roles
    @users = (params[:search] ?
                users.search(params[:search], star: true) :
                users).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls { send_data @users.to_xls, content_type: 'application/vnd.ms-excel', filename: 'users.xls' }
    end
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    successfully_updated = if !params[:user][:password].blank?
      @user.update_attributes!(params[:user])
    else
      @user.update_without_password(params[:user])
    end
    respond_to do |format|
      if successfully_updated
        format.html { redirect_to users_path, notice: "User was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def status
    user = User.find(params[:id])
    user.update_attributes!(account_active: !user.account_active)
    render nothing: true
  end
end

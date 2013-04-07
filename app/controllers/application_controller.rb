class ApplicationController < ActionController::Base
  require 'will_paginate/array'

  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private
  def authorize_role
    @user = User.new
    authorize! :all, @user
  end
end

class ApplicationController < ActionController::Base
  require 'will_paginate/array'

  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def object_delete_check(data)
    if data[:conditional_check]
      msg = "You can't delete this #{data[:main_obj].name} #{data[:main_obj].class.name} as"
      for i in 1..data["relational_objs"].size
        if data["relational_objs"]["obj"+i.to_s].present?
          msg += " and" if i > 1
          msg += " it is associated with #{'this'.pluralize(data["relational_objs"]["obj"+i.to_s].size)}
                 #{data["relational_objs"]["obj"+i.to_s].collect(&:name).join(', ')}
                #{data["relational_objs"]["obj"+i.to_s].first.class.name.pluralize(data["relational_objs"]["obj"+i.to_s].size)}"
        end
      end
    else
      data[:main_obj].destroy
      msg = "#{data[:main_obj].class.name} was successfully deleted."
    end
    msg
  end

  private
  def authorize_role
    @user = User.new
    authorize! :all, @user
  end
end

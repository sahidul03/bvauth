class AdminsController < ApplicationController

  def index
    admin_check
    @departments = Department.all
  end

  def admin_check
    if current_user.user_type == 'manager'
      redirect_to managers_path
    elsif current_user.user_type == 'user'
      redirect_to user_path(current_user)
    end
  end

end

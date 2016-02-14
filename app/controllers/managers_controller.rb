class ManagersController < ApplicationController
  before_action :manager_check
  def index

  end

  def manager_check
    if current_user.user_type == 'admin'
      redirect_to admins_path
    elsif current_user.user_type == 'user'
      redirect_to user_path(current_user)
    end
  end
end

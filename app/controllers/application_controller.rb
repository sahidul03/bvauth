class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def user_define
    if current_user.user_type == 'admin'
      redirect_to admins_path
    elsif current_user.user_type == 'manager'
      redirect_to managers_path
    elsif current_user.user_type == 'user'
      redirect_to user_path(current_user)
    end
  end

end

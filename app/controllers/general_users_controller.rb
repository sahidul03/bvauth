class GeneralUsersController < ApplicationController

  def create
    @user = User.new(params_general_user)
    @department = Department.find(params[:user][:department_id])

    # permission check
    permission_check(params[:user][:department_id])

    if @user.save
      redirect_to department_path(@department)
    else
      render 'new_user'
    end
  end

  def new_user
    # permission check
    permission_check(params[:id])

    @department = Department.find(params[:id])
    @user = @department.users.build
  end

  def params_general_user
    params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation, :department_id).merge(:department_id => params[:user][:department_id], :user_type => 'user')
  end

  def permission_check(dept_id)
    if current_user.user_type == 'admin' || current_user.department.id == dept_id
      #fine
    else
      flash[:alert] = "Permission denied."
      redirect_to user_path(current_user)
    end
  end

end

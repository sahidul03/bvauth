class DepartmentsController < ApplicationController


  def new
    # permission check
    if current_user.user_type == 'admin'
      #fine
    else
      flash[:alert] = "Permission denied."
      redirect_to user_path(current_user)
    end

    @department = Department.new
  end

  def show
    # permission check
    permission_check(params[:id])
    @department = Department.find(params[:id])
    @users = @department.users
  end

  def create
    # permission check
    if current_user.user_type == 'admin'
      #fine
    else
      flash[:alert] = "Permission denied."
      redirect_to user_path(current_user)
    end


    @department = Department.new(params_department)
    if @department.save
      redirect_to department_path(@department)
    else
      render 'new'
    end
  end

  def permission_check(dept_id)
    if current_user.user_type == 'admin' || (current_user.department.id == dept_id.to_i && current_user.user_type == 'manager')
      #fine
    else
      flash[:alert] = "Permission denied."
      redirect_to user_path(current_user)
    end
  end

  protected

  def params_department
    params.require(:department).permit(:name)
  end

end

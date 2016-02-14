class UsersController < ApplicationController

  def index
    user_define
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(:phone_number => params[:user][:phone_number])
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  def assign_role
    @user = User.find(params[:id])
  end

  def save_assigned_role
    @user = User.find(params[:user][:id])
    if @user.update(:user_type => params[:role])
      redirect_to department_path(@user.department)
    end
  end

end

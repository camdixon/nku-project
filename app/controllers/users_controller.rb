class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    redirect_to users_path, notice: "Successfully created #{@user.name}"
  end
  
  def index
    @user = User.find(session[:user_id])
    if @user == current_user
      render :index
    else
      redirect_to new_session_path, notice: "You need to login first to view schedules."
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to users_path, notice: "You do not have permission to edit #{@user.name}'s profile."
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
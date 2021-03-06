class StudiosController < ApplicationController
  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)

    if @studio.save
      redirect_to new_user_path, notice: "You added your studio to the available list."
    else
      render :new
    end
  end
  
  def index
    @studio = Studio.find(current_user.studio_id)
  end
  
  private
  
  def studio_params
    params.require(:studio).permit!
  end
end
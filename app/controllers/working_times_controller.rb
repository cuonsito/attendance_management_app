class WorkingTimesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @user = User.find(params[:user_id])
    @working_time = WorkingTime.new
  end

  def create
    @user = User.find(params[:user_id])
    if current_user == @user
      @user = User.find(params[:user_id])
      @working_time = WorkingTime.new(working_time_params)
      @working_time.user_id = @user.id
      if @working_time.save
        redirect_to user_working_times_path
      else
        render 'index'
      end
    else
      flash[:danger] = "Don't touch me!"
      redirect_to users_url
    end
  end

  def destroy
    @working_time = WorkingTime.find(params[:id])
    @working_time.destroy
    redirect_to user_working_times_path(@working_time.user_id)
  end


  private

    def working_time_params
      params.require(:working_time).permit(:time, :date, :project_id)
    end

end

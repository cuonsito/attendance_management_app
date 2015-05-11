class WorkingTimesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @user = User.find(params[:user_id])
    @working_time = WorkingTime.new
    # @working_time = WorkingTime.find(params[:user_id])
    # @working_time = WorkingTime.where(user_id: params[:user_id])
    # @user.working_times
  end

  def create
    @user = User.find(params[:user_id])
    @working_time = WorkingTime.new(working_time_params)
    @working_time.user_id = @user.id
    if @working_time.save
      redirect_to user_working_times_path
    else
      render 'index'
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

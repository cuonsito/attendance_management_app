class WorkingTimesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    # TODO change by params
    @user = User.find(params[:user_id])
    @project = Project.all
  end

  def create
    WorkingTime.new
  end

end

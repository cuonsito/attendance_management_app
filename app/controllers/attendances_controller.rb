class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    # TODO change by params
    @user = User.find(params[:id])
  end
end

class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:menu, :projects, :classes]

  def home
    redirect_to menu_path if signed_in?
  end

  def menu
  end

  def projects
  end

  def classes
  end
end

class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:menu, :users, :projects, :classes]
  before_action :home_page, only: :home

  def home
  end

  def menu
  end

  def users
    @users = User.all
  end

  def projects
  end

  def classes
  end

  private

    def home_page
      if signed_in?
        redirect_to menu_path
      end
    end
end

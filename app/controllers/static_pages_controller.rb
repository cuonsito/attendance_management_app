class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:menu, :users]
  before_action :home_page, only: :home

  def home
  end

  def menu
  end

  def users
    @users = User.all
  end

  private

    def home_page
      if signed_in?
        redirect_to menu_path
      end
    end
end

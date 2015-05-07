class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:menu, :list]

  def home
  end

  def menu
  end

  def list
    @users = User.all
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    puts 'called new'
  end

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end

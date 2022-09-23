class UsersController < ApplicationController
  def new
    puts 'called new'
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end

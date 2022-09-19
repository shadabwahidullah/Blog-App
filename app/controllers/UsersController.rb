class UsersController < ApplicationController
  def new
    puts 'called new'
  end

  def index
    @users = User.all
  end
  def show
    puts params
    @users = User.find(params[:id])
  end
end
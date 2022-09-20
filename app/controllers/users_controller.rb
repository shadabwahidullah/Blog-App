class UsersController < ApplicationController
  def new
    puts 'called new'
  end

  def index
    @users = User.all
  end

  def show
    puts params
  end
end

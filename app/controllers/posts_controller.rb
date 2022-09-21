class PostsController < ApplicationController
  def new
    puts 'called new'
  end

  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show; end
end

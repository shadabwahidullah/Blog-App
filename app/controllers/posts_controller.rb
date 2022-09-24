class PostsController < ApplicationController

  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
  end
end

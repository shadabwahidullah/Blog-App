class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:comments).where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author_id = params[:user_id]
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved'
          redirect_to user_posts_url(current_user)
        else
          flash.now[:error] = 'Error: post can not be saved'
        end
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
  end
end

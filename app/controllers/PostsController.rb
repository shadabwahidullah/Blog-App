class PostsController < ApplicationController
  def new
    puts 'called new'
  end

  def index
    @posts = Post.all
  end

  def show
    
  end
end
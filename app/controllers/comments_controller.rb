class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @author = current_user
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment saved'
          @comment.update_comments_counter
          redirect_to user_post_url(current_user, @post)
        else
          flash.now[:error] = 'there was an error while saving the comment'
        end
      end
    end
  end
end

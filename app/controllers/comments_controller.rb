class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.create(comment_params)
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :comment)
  end
end
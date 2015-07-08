class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.create(comment_params)
    @comment.save!

    respond_to do |format|
      format.html { redirect_to @post}
      format.js #render comments/create.js.erb
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :comment)
  end
end
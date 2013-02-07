class CommentsController < ApplicationController

  def create
    @comment = Comment.create comment_params
    flash[:notice] = "Successfully posted your comment"
    redirect_to article_path(@comment.article)
  end
  
  def comment_params
    params[:comment].permit(:author, :body, :article_id)
  end
end

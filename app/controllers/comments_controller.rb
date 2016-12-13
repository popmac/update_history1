class CommentsController < ApplicationController

  def new
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    @review = Review.find(params[:review_id])
    Comment.create(comment_params)
    redirect_to "/reviews/#{@review.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, review_id: @review.id)
  end

end

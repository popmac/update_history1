class CommentsController < ApplicationController

  def new
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    @review = Review.find(params[:review_id])
    comment = Comment.create(comment_params)
    users = User.all
    users.each do |user|
      CheckedComment.create(review_id: @review.id, comment_id: comment.id, checking_user_id: user.id)
    end
    redirect_to "/reviews/#{@review.id}"
  end

  def edit
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @review = Review.find(params[:review_id])
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to "/reviews/#{@review.id}"
  end

  def destroy
    @review = Review.find(params[:review_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to "/reviews/#{@review.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, review_id: @review.id)
  end

end

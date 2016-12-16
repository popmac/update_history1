class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    review =  Review.create(review_params)
    users = User.all
    users.each do |user|
      CheckedReview.create(review_id: review.id, checking_user_id: user.id)
    end
    redirect_to :root
  end

  def show
    @review = Review.find(params[:id])
    # ▼reviewの既読
    @checked_review = CheckedReview.where(checking_user_id: current_user.id, review_id: @review.id).first_or_initialize
    @checked_review.review_id = @review.id
    @checked_review.checking_user_id = current_user.id
    if @checked_review.checked_flag == false
      @checked_review.checked_flag = 1
    end
    @checked_review.save
    # ▲reviewの既読
    # ▼commentの既読
    @comments = @review.comments.includes(:user)
    @comments.each do |comment|
      @checked_comment = CheckedComment.where(checking_user_id: current_user.id, review_id: @review.id, comment_id: comment.id).first_or_initialize
      @checked_comment.review_id = @review.id
      @checked_comment.checking_user_id = current_user.id
      @checked_comment.comment_id = comment.id
      if @checked_comment.checked_flag == false
        @checked_comment.checked_flag = 1
      end
      @checked_comment.save
    end
    # ▲commentの既読
    # ▼likeの既読
    @likes = @review.likes
    @likes.each do |like|
      @checked_like = CheckedLike.where(checking_user_id: current_user.id, review_id: @review.id, like_id: like.id).first_or_initialize
      @checked_like.review_id = @review.id
      @checked_like.checking_user_id = current_user.id
      @checked_like.like_id = like.id
      if @checked_like.checked_flag == false
        @checked_like.checked_flag = 1
      end
      @checked_like.save
    end
    # ▲likeの既読
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to :root
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to :root
  end

  private
  def review_params
    params.require(:review).permit(:name, :content).merge(user_id: current_user.id)
  end
end

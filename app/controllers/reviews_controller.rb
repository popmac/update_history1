class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
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

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

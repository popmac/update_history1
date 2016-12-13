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


  private
  def review_params
    params.require(:review).permit(:name, :content).merge(user_id: current_user.id)
  end
end

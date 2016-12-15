class Review < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_paper_trail
  has_many :checked_reviews

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def check_unread_review(user_id, review_id)
    self.checked_reviews.where(checking_user_id: user_id, review_id: review_id)
  end
end

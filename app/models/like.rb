class Like < ActiveRecord::Base
  belongs_to :review, counter_cache: :likes_count
  belongs_to :user
  validates :user_id, :uniqueness => {:scope => :review_id}
  has_paper_trail
  has_many :checked_likes

  def checked_unread_like(user_id, review_id, like_id)
    self.checked_likes.where(checking_user_id: user_id, review_id: review_id, like_id: like_id)
  end
end

class Comment < ActiveRecord::Base
  belongs_to :user
  has_paper_trail
  has_many :checked_comments

  def check_unread_comment(user_id, review_id, comment_id)
    self.checked_comments.where(checking_user_id: user_id, review_id: review_id, comment_id: comment_id)
  end
end

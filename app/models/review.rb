class Review < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_paper_trail

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end

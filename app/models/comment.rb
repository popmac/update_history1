class Comment < ActiveRecord::Base
  belongs_to :user
  has_paper_trail
  has_many :checked_comments
end

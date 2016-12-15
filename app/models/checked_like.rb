class CheckedLike < ActiveRecord::Base
  belongs_to :review
  belongs_to :like
end

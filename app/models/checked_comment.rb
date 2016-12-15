class CheckedComment < ActiveRecord::Base
  belongs_to :review
  belongs_to :comment
end

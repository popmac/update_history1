class CheckHistoryController < ApplicationController
  def index
    @histories = PaperTrail::Version.order('created_at DESC').where.not(whodunnit: current_user)
    # reviewについて
    @checked_review = CheckedReview.where(checking_user_id: current_user.id)
    @checked_review.each do |checked_review|
      if checked_review.checked_flag == false
        checked_review.checked_flag = 1
        checked_review.save
      end
    end
    # commentについて
    @checked_comment = CheckedComment.where(checking_user_id: current_user.id)
    @checked_comment.each do |checked_comment|
      if checked_comment.checked_flag == false
        checked_comment.checked_flag = 1
        checked_comment.save
      end
    end
    # likeについて
    @checked_like = CheckedLike.where(checking_user_id: current_user.id)
    @checked_like.each do |checked_like|
      if checked_like.checked_flag == false
        checked_like.checked_flag = 1
        checked_like.save
      end
    end
  end
end

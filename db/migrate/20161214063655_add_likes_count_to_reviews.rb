class AddLikesCountToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :likes_count, :integer, default: 0
  end
end

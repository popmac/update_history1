class CreateCheckedReviews < ActiveRecord::Migration
  def change
    create_table :checked_reviews do |t|
      t.integer :review_id
      t.integer :checking_user_id
      t.boolean :checked_flag, default: false, null: false
      t.timestamps null: false
    end
  end
end

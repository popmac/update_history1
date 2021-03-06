class CreateCheckedLikes < ActiveRecord::Migration
  def change
    create_table :checked_likes do |t|
      t.integer :review_id
      t.integer :like_id
      t.integer :checking_user_id
      t.boolean :checked_flag, default: false, null: false
      t.timestamps null: false
    end
  end
end

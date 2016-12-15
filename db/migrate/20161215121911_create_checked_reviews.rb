class CreateCheckedReviews < ActiveRecord::Migration
  def change
    create_table :checked_reviews do |t|

      t.timestamps null: false
    end
  end
end

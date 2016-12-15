class CreateCheckedLikes < ActiveRecord::Migration
  def change
    create_table :checked_likes do |t|

      t.timestamps null: false
    end
  end
end

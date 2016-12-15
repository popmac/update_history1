class CreateCheckedComments < ActiveRecord::Migration
  def change
    create_table :checked_comments do |t|

      t.timestamps null: false
    end
  end
end

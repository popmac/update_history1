class CreateUserRelationships < ActiveRecord::Migration
  def change
    create_table :user_relationships do |t|

      t.timestamps null: false
    end
  end
end

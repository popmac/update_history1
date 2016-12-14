class CreateUserRelationships < ActiveRecord::Migration
  def change
    create_table :user_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.timestamps null: false
    end
    add_index :user_relationships, :follower_id
    add_index :user_relationships, :followed_id
    # follower_idとfollowed_idの組み合わせが一意性を持つようにする
    add_index :user_relationships, [:follower_id, :followed_id], unique: true
  end
end

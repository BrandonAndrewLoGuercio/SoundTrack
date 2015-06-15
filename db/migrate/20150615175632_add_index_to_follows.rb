class AddIndexToFollows < ActiveRecord::Migration
  def change
    add_index :follows, :follower_id
    add_index :follows, :following_id
    add_index :follows, [:follower_id, :following_id], unique: true
  end
end

class ChangeFollowerAndFollowingToAddId < ActiveRecord::Migration
  def change
    change_table :follows do |t|
      t.rename :following, :following_id
      t.rename :follower, :follower_id
    end
  end
end

class AddVideoidToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :video_id, :string
    add_column :posts, :user_id, :integer
  end
end

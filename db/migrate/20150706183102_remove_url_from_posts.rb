class RemoveUrlFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :url, :string
  end
end

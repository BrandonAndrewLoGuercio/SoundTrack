class AddTitleRemoveMessageFromPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    remove_column :posts, :message
  end
end

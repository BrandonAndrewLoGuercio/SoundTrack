class AddPostTitle < ActiveRecord::Migration
  def change
    add_column :posts, :post_title, :string
  end
end

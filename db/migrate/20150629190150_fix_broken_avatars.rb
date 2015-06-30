class FixBrokenAvatars < ActiveRecord::Migration
  def change
    User.connection.execute "UPDATE users SET avatar = null WHERE avatar like '--%'"
  end
end

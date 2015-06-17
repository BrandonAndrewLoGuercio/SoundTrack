module UsersHelper
  def follow_or_unfollow_button user
    if user.followed_by current_user
      render partial: 'unfollow_button', locals: {user: user}
    else
      render partial: 'follow_button', locals: {user: user}
    end
  end
end
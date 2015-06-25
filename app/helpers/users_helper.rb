module UsersHelper
  def follow_or_unfollow_button user
    if user.followed_by current_user
      render partial: 'unfollow_button', locals: {user: user}
    else
      render partial: 'follow_button', locals: {user: user}
    end
  end

  def profile_avatar_for(user)
    image_tag(user.avatar_url(:profile).to_s, :alt => "avatar", :class => "round-3")
  end

  def nav_avatar_for(user)
    image_tag(user.avatar_url(:nav).to_s, :alt => "avatar", :class => "round-3")
  end

  def thumb_avatar_for(user)
    image_tag(user.avatar_url(:thumb).to_s, :alt => "avatar", :id => "align-middle", :class => "round-3")
  end

end
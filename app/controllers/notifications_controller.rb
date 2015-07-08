class NotificationsController < ApplicationController
  def index
    if current_user
      @user = current_user
      @notifications = current_user.get_notifications
      @follower_count = current_user.followers.count
      @following_count = current_user.followings.count
      @headline = current_user.headline
    end
  end
end
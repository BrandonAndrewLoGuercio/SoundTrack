class NotificationsController < ApplicationController


  def index
    if current_user
      @user = current_user
      @notifications = current_user.get_notifications
      @follower_count = current_user.followers.count
      @following_count = current_user.followings.count
      @headline = current_user.headline
      current_user.update last_notified: Time.new
    end
  end

  def update
    current_user.update_attribute(:last_notified, Time.now)
    # @user = User.find(current_user)
    # @user.update_attributes(user_params)

  end

  def get_notifications
    @comments = current_user.get_notifications

  end

  private
    def user_params
      params.require(:user).permit(:last_notified)
    end
end
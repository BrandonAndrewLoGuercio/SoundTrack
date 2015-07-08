class NotificationsController < ApplicationController
  def index
    @notifications = current_user.get_notifications
  end
end
class FollowingController < ApplicationController
  def index
    @following_relationships = Relationship.where(follower_id: current_user).all
  end
end
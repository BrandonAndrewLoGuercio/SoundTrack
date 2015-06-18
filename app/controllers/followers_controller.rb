class FollowersController < ApplicationController
  def index
    @follower_relationships = Relationship.where(following_id: current_user).all
  end
end
class UsersController < ApplicationController
  def index
    if params[:search]
      @users = User.all
      @users = User.search(params[:search])
    else
      @users = []
    end
  end

  def show
    @user = User.find(params[:id])
    @follower_count = @user.followers.count
    @following_count = @user.followings.count
<<<<<<< HEAD
    @posts = Post.where(user_id: current_user).order(created_at: :desc)
=======
    @headline = @user.headline
    @posts = Post.where(user_id: @user.id).order(created_at: :desc)
>>>>>>> master

  end

  def following
    @user = User.find(params[:id])
    @following = Relationship.where(follower_id: @user.id).all
  end

  def followers
    @user = User.find(params[:id])
    @followers = Relationship.where(following_id: @user.id).all
  end
end
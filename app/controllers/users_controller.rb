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
    @posts = Post.where(user_id: @user.id).order(created_at: :desc)
  end

  def following
    @user = User.find(params[:id])
    @following = Relationship.where(follower_id: @user.id).all
  end

  def followers
    @user = User.find(params[:id])
    @followers = Relationship.where(following_id: @user.id).all
  end

  def edit
    @user = current_user
    render 'edit'

  end

  def update
    @user = current_user
    @user.update(params[:account_update])
  end

  def delete
    @user = current_user
  end
end

#
# private
#
#   def user_params
#     params.require(:user).permit!
#   end

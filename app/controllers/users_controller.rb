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
    @user = User.find(current_user)
    #{"user"=>{"username"=>"Trey Dev", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]", "email"=>"af2cp7_j9v@facebook.com", "headline"=>"", "avatar"=>#<ActionDispatch::Http::UploadedFile:0x007febd21e0c38 @tempfile=#<Tempfile:/var/folders/k5/8qpwc2tx74v19bchp_l6jh940000gn/T/RackMultipart20150708-1660-1oxjyfq.jpg>, @original_filename="1107_unicorn_head_mask_inuse.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"user[avatar]\"; filename=\"1107_unicorn_head_mask_inuse.jpg\"\r\nContent-Type: image/jpeg\r\n">, "remote_avatar_url"=>"", "remove_avatar"=>"0"}, "commit"=>"Update", "id"=>"19"}
    if params['user']['password'].blank? && params['user']['password_confirmation'].blank?
      params['user'].delete('password')
      params['user'].delete('password_confirmation')
    end
    @user.update_attributes(user_params)
    render 'edit'
  end

  def delete
    @user = current_user
  end


private

  def user_params
    params.require(:user).permit!
  end

  def new_notifications

  end
end
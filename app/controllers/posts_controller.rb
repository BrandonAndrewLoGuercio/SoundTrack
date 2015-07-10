class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  skip_before_filter :verify_authenticity_token, :only => :create


  def index
    @posts = Post.all
  end


  def show
  end

  def my_posts
    @posts = current_user.posts
    @user = current_user
    render 'welcome/index'
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    Post.create(post_params)
      redirect_to '/'
  end


  def update
  end


  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end


  def post_params
    params.require(:post).permit!
  end
end


class VideosController < ApplicationController

  def client
    @client ||= Yourub::Client.new
  end

  def index
    @countries = client.countries
    if request.post?
      client.search(params)
      @videos = client.videos
    end
    @posts = Post.all
    @follower_relationships = Relationship.where(following_id: current_user).all
    @following_relationships = Relationship.where(follower_id: current_user).all
    @headline = Headline.find_by(user_id: current_user.id) if user_signed_in?

    render 'welcome/index'
  end

  def details
    client.extended_info = true
    @video = client.search(id: params[:id])
  end
end
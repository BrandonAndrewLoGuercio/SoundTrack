class RelationshipsController < ApplicationController
  def create
    # @user = User.find(params[:id])
    Relationship.create relationship_params
    redirect_to :back
  end

  def destroy_via_users
    target = Relationship.find_by follower_id: params[:follower_id], following_id: params[:following_id]
    if target
      target.destroy
      redirect_to :back
    else
      flash[:error] = "No such relationship"
      redirect_to :back
    end
  end

  private

  def relationship_params
    params.require(:relationship).permit(:following_id, :follower_id)
  end
end
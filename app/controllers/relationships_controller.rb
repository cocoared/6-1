class RelationshipsController < ApplicationController

  # フォローするとき
  def create
    user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end


  # フォローを外すとき
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー一覧
  def follows
    user = User.find(params[:user_id])
    @users = user.follows
  end

  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end

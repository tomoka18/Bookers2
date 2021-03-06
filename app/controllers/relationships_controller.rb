class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    following = current_user.follow(user)
    if following.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    user = User.find(params[:user_id])
    following = current_user.unfollow(user)
    if following.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

end

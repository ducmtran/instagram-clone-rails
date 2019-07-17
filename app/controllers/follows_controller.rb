class FollowsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    @following_count = @user.follow_count 
    @follower_count = @user.followers_count

    @followings = @user.all_following
    @followers = @user.followers
  end

  def create
    user = User.find(current_user.id)
    followed_user = User.find(params[:id])
    user.follow(followed_user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    user = User.find(current_user.id)
    followed_user = User.find(params[:id])
    user.stop_following(followed_user)
    respond_to do |format|
      format.js
    end
  end
end
class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(current_user.id)
    followed_user = User.find(params[:id])
    user.follow(followed_user)
  end

  def destroy
    user = User.find(current_user.id)
    followed_user = User.find(params[:id])
    user.stop_following(followed_user)
  end
end
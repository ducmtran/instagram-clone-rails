class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:post_id], user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @unlike = Like.find_by(post_id: params[:post_id])
    respond_to do |format|
      format.js
    end
  end
end
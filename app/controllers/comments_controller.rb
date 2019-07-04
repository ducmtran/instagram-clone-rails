class CommentsController < ApplicationController
  def create
    Comment.create!(text: params[:comment][:text], post_id: params[:post_id], user_id: current_user.id)
    redirect_to root_path
  end

end
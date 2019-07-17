class CommentsController < ApplicationController
  def create
    @comment = Comment.new(text: params[:comment][:text], post_id: params[:post_id], user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

end
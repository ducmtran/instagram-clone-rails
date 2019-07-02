class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    current_user.posts.create(caption: post_params[:caption])
    redirect_to home_path
  end

  def post_params
    params.require(:new_post).permit(:caption)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(caption: params[:edit_post][:caption])
    redirect_to home_path
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to home_path
  end
end

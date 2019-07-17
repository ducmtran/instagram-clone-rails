class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    @post = current_user.posts.new(caption: post_params[:caption])
    if @post.save
      redirect_to view_profile_path(current_user.id)
    else
      @errors = @post.errors.full_messages
      render :new
    end
  end

  def post_params
    params.require(:new_post).permit(:caption)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(caption: params[:post][:caption])
      redirect_to view_profile_path(current_user.id)
    else
      render :edit     
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to view_profile_path(current_user.id)
  end
end

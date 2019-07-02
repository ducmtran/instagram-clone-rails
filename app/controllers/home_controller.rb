class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    # only get post by user here
    @all_posts = User.select('posts.caption', 'posts.created_at', 'posts.updated_at', 'posts.id').joins(:posts).where('users.id' => current_user.id).order('posts.created_at').reverse_order
    
    @profile = User.select(:handle, :name, :bio, 'profiles.id').joins(:profile).find_by('users.id' => current_user.id)
  end

  def view_following
    @all_users = User.all
    @user = User.find(current_user.id)
    @following_count = @user.follow_count 
    @followings = @user.all_following
  end
end

class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    #todo: show posts by following users here
    @posts = Post.joins("INNER JOIN follows ON posts.user_id = follows.followable_id")
      .where("follows.follower_id = ?", current_user.id).order('posts.updated_at').reverse_order

    #show profile
    @profile = User.select(:handle, :name, :bio, 'profiles.id').joins(:profile).find_by('users.id' => current_user.id)
  end
end

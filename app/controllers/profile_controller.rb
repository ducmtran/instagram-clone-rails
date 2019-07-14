class ProfileController < ApplicationController
  def show
    id = params[:id]

    @user = User.find(id)

    @following_count = @user.follow_count 
    @follower_count = @user.followers_count

    @profile = User.select(:handle, :name, :bio, 'profiles.id').joins(:profile).find_by('users.id' => id)

    # only get post by user here
    @all_posts = Post.joins(:user).select(:id, :caption, :created_at, :updated_at, :user_id).where('users.id' => id).order('posts.updated_at').reverse_order

  end

  def update
    @pf = Profile.find_by(user_id: id)
    @pf.update(handle: pf_params[:handle], name: pf_params[:name], bio: pf_params[:bio])
    redirect_to home_path
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  protected
  def pf_params
    params.require(:profile).permit(:handle, :name, :bio)
  end

end

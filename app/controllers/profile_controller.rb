class ProfileController < ApplicationController
  def show
    id = params[:id]
    @self = false
    if id.to_i == current_user.id
      @self = true
    end
    puts @self

    @user = User.find(id)

    @following_count = @user.follow_count 
    @follower_count = @user.followers_count

    @profile = User.select(:handle, :name, :bio, 'profiles.id').joins(:profile).find_by('users.id' => id)

    # only get post by user here
    @all_posts = User.select('posts.caption', 'posts.created_at', 'posts.updated_at', 'posts.id').joins(:posts).where('users.id' => id).order('posts.created_at').reverse_order
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

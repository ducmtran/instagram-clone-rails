class ProfileController < ApplicationController
  def update
    @pf = Profile.find_by(user_id: current_user.id)
    @pf.update(handle: pf_params[:handle], name: pf_params[:name], bio: pf_params[:bio])
    redirect_to home_path
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  protected
  def pf_params
    params.require(:update_profile).permit(:handle, :name, :bio)
  end
end

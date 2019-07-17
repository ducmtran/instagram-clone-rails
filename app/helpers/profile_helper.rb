module ProfileHelper
  def profile_pic(name)
    robohash = 'https://robohash.org/' + name.to_s + '?set=set5'
  end

  def self_profile(id)
    id.to_i == current_user.id
  end

  def user_followed?(id)
    current_user.following?(User.find_by(id: id))
  end
end

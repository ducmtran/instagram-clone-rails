module ProfileHelper
  def profile_pic(name)
    robohash = 'https://robohash.org/' + name.to_s + '?set=set5'
  end
end

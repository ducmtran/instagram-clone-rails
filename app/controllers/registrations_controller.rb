class RegistrationsController < Devise::RegistrationsController
  def create
    super do |r|
      Profile.create(handle: 'your_handle', name: 'Your name', user_id: r.id)
    end
  end
end
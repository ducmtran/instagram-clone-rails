Rails.application.routes.draw do

  # skip: prevent creating default routes
  # controllers: switch to custom controller
  # path: remove 'user' from URI pattern
  devise_for :user, skip: [], path: '', controllers: { registrations: 'registrations'}

  authenticated :user do
    root 'home#index', as: 'home'
  end
  unauthenticated :user do
    root 'welcome#index'
  end

  resources :posts, except: [:index]
  resources :comments, only: [:create, :destroy, :show]

  # devise_scope: customize default routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about', to: 'welcome#about'

  #profile
  get '/view/:id', to: 'profile#show', as: 'view_profile'
  get '/profile/edit', to: 'profile#edit'
  patch '/profile/update', to: 'profile#update'
  get '/view_all', to: 'profile#show_all'

  #followings
  get '/follows/:id', to: 'follows#show', as: 'follows'
  post '/follow/:id', to: 'follows#create', as: 'follow'
  delete '/unfollow/:id', to: 'follows#destroy', as: 'unfollow'

  #likes
  post '/like/:post_id', to: 'likes#create', as: 'like'
  delete '/unlike/:post_id', to: 'likes#destroy', as: 'unlike'

end

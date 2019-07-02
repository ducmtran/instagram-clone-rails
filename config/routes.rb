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

  # devise_scope: customize default routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about', to: 'welcome#about'
  get '/home', to: 'welcome#home'

  #profile
  get '/profile/edit', to: 'profile#edit'
  patch '/profile/update', to: 'profile#update'
  
  #followings
  get '/users', to: 'home#view_following'
  post '/follow/:id', to: 'follows#create', as: 'follow'
  delete '/unfollow/:id', to: 'follows#destroy', as: 'unfollow'
end

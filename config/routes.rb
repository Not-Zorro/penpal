Rails.application.routes.draw do
  root 'welcome#index'

  get '/landing', to: 'landing#index'
  get '/survey', to: 'survey#index'

  get '/profile', to: 'users#show'
  get '/buddies', to: 'buddies#index'
  get '/buddies/new', to: 'buddies#new'
  post '/buddies', to: 'buddies#create'
  post '/survey', to: 'survey#create'

  resources :users, only: [:edit, :update, :destroy]

  delete '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: 'users#create'

  get '/auth/spotify', as: 'spotify'
  get '/auth/spotify/callback', to: 'spotify#create'
end

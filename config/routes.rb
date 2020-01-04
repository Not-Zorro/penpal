Rails.application.routes.draw do
  root 'welcome#index'

  get '/landing', to: 'landing#index'
  get '/survey', to: 'survey#index'

  get '/profile', to: 'users#show'
  post '/survey', to: 'survey#create'

  resources :buddies, except: :show
  resources :users, only: [:edit, :update, :destroy]

  get '/preferences', to: 'users/preferences#index'
  get '/preferences/edit', to: 'users/preferences#edit'
  patch '/preferences', to: 'users/preferences#update'

  get '/dbt', to: 'dbt#show'
  post '/feedback', to: 'feedback#create'

  delete '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: 'users#create'

  get '/auth/spotify', as: 'spotify'
  get '/auth/spotify/callback', to: 'spotify#create'
end

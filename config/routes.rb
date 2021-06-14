Rails.application.routes.draw do
  
 
  
  get 'sessions/new'
 # get 'sessions/destroy'
  root to: 'application#welcome'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create', as: 'session'
  
  
 

devise_for :artists
resources :artists

post 'admin/users/:user_id/tats/new', to: "tats#new"

scope '/admin' do
  resources :users do
    devise_for :tats
    resources :tats, only: [:new, :create], as: "tat"
    post 'admin/users/:user_id/tats/new', to: "tats#new"
end
end

devise_for :tats
resources :tats, as: "tat"

  delete '/signout', to: 'sessions#destroy'
end


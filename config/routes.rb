Rails.application.routes.draw do
  
 
  
  get 'sessions/new'
 # get 'sessions/destroy'
  root to: 'application#welcome'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create', as: 'session'
  
  
 

devise_for :artists
resources :artists


scope '/admin' do
  resources :users do
    devise_for :tats
    resources :tats, only: [:new, :create]
end
end

devise_for :tats
resources :tats

  delete '/signout', to: 'sessions#destroy'
end


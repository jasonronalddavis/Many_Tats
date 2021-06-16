Rails.application.routes.draw do
  
 
  
  get 'sessions/new'
 # get 'sessions/destroy'
  root to: 'application#welcome'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create', as: 'session'
  
  
 



post 'admin/users/:user_id/tats/new', to: "tats#new"

scope '/admin' do

  devise_for :artists
  resources :artists do 
    resources :tats
  end

  resources :users do
    devise_for :artists
    resources :artists, only: [:show, :index, :destroy]
    devise_for :tats
    resources :tats, only: [:new, :create, :index, :show, :destroy, :edit, :patch, :update]
    post 'admin/users/:user_id/tats/new', to: "tats#new"
end
end


resources :tats
  

delete '/signout', to: 'sessions#destroy'
end


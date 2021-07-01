Rails.application.routes.draw do
  
  


 
    

  root to: 'application#welcome'


  resources :sessions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  delete '/signout', to: 'sessions#destroy'



  namespace :admin do

  get '/admin/sessions/:id/signout', to: 'sessions#destroy'
  resources :sessions do
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create', as: 'session'
 end


  root to: 'application#welcome'
  

  resources :tats do
  get '/tats/:id/remove_artist', to: 'tats#remove_artist'
    post '/tats/:id/remove_artist', to: 'tats#remove_artist' 
end



  resources :artists do 
    resources :users
    resources :tats
    get '/tats/:id/remove_artist', to: 'tats#remove_artist'
    post '/tats/:id/remove_artist', to: 'tats#remove_artist'
end


  resources :users do
    devise_for :artists
    resources :artists, only: [:show, :index, :destroy]
   resources :tats
end
end

resources :tats


resources :artists
get 'artists/add_artist'
post 'artists/add_artist'

end


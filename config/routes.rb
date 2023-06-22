Rails.application.routes.draw do
  
  


 
    

  






  root to: 'application#welcome'
  

  resources :sessions

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  delete '/signout', to: 'sessions#destroy'
 

  namespace :admin do

  root to: 'application#welcome'

  get '/admin/sessions/:id/signout', to: 'sessions#destroy'
  resources :sessions do
  get 'sessions/signin', to: 'sessions#new'
  post 'sessions/signin', to: 'sessions#create', as: 'session'
end

get 'tats/:id/approve_tat', to: 'tats#approve_tat'
post 'tats/:id/approve_tat', to: 'tats#approve_tat'
 
resources :tats do
    get 'tats/:id/approve_tat', to: 'tats#approve_artist'
   get '/tats/:id/remove_artist', to: 'tats#remove_artist'
    post '/tats/:id/remove_artist', to: 'tats#remove_artist' 
end


  resources :artists do 
    resources :users
    resources :tats
    get 'tats/:id/approve_tat', to: 'tats#approve_artist'
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
get 'about', to: 'tats#about'
post 'about', to: 'tats#about'





resources :users
get 'users/add_user'




get'/auth/:provider/callback', to: "sessions#omniauth"


resources :artists
get 'artists/:id/add_artist', to: 'artists#add_artist'
post 'artists/:id/add_artist', to: 'artists#add_artist'

end


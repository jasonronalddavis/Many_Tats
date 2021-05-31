Rails.application.routes.draw do
  
get 'application/welcome'
get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
get '/login', to: 'sessions#new'
match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
root 'welcome#home'

resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
